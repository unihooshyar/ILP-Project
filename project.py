import subprocess
import time
import re
import os
import csv
import shutil
from datetime import datetime

# --- CONFIGURATION ---
POPPER_PATH = "/home/ali/popper_venv/lib/python3.12/site-packages/popper.py"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
BK_SOURCE = os.path.join(BASE_DIR, "bk.pl")
LOG_FILE = os.path.join(BASE_DIR, "results_log.csv")

# Exact folder names from your hierarchy
TASKS = ["Ancestor", "Grandparent", "Sibling", "Uncle", "Aunt"]

def parse_results(output, duration):
    """Extracts the learned program and search metrics from Popper's output."""
    # Matches the multi-line block between SOLUTION and the star line
    rule_match = re.search(r'SOLUTION \**\n.*?\n(.*?)[\n]?\*{10}', output, re.DOTALL)
    
    # Matches the count of programs explored
    hyp_match = re.search(r'TOTAL_HYPOTHESES: (\d+)', output)
    
    return {
        "rule": rule_match.group(1).strip() if rule_match else "FAILED",
        "hypotheses": hyp_match.group(1) if hyp_match else "N/A",
        "time": round(duration, 4)
    }

def run_benchmarks():
    print(f"🚀 Starting ILP Benchmark Suite at {datetime.now().strftime('%H:%M:%S')}")
    print(f"Root Directory: {BASE_DIR}\n" + "-"*60)

    results_data = []

    for task in TASKS:
        task_path = os.path.join(BASE_DIR, task)
        task_bk = os.path.join(task_path, "bk.pl")
        
        if not os.path.exists(task_path):
            print(f"⚠️ Skipping {task}: Folder not found.")
            continue

        # 1. Temporarily copy bk.pl into the task folder so Popper can see it
        shutil.copy(BK_SOURCE, task_bk)

        print(f"🔎 Analyzing Task: {task:12}", end=" ", flush=True)
        
        start_time = time.time()
        
        # 2. Execute Popper on the sub-folder
        process = subprocess.run(
            ['python3', POPPER_PATH, task_path],
            capture_output=True,
            text=True
        )
        
        duration = time.time() - start_time
        metrics = parse_results(process.stdout, duration)
        metrics["task"] = task
        
        results_data.append(metrics)
        
        # 3. Terminal Output Logic
        status = "✅ Success" if metrics["rule"] != "FAILED" else "❌ Failed"
        print(f"{status} ({metrics['time']}s)")
        
        if metrics["rule"] != "FAILED":
            # Indent and print the rule for clear terminal reading
            indented_rule = "      " + metrics["rule"].replace("\n", "\n      ")
            print(f"   📜 Rule Found:\n{indented_rule}\n")
        else:
            print(f"   ℹ️  No solution found for {task}.\n")

        # 4. Clean up: Remove the temporary bk.pl copy
        if os.path.exists(task_bk):
            os.remove(task_bk)

    save_to_log(results_data)
    print("-" * 60)
    print(f"📊 Comparison report saved to: {LOG_FILE}")

def save_to_log(data_list):
    # Overwrites the log file with fresh data each time the benchmark is run
    with open(LOG_FILE, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=["task", "time", "hypotheses", "rule"])
        writer.writeheader()
        writer.writerows(data_list)

if __name__ == "__main__":
    run_benchmarks()