head_pred(ancestor, 2).
body_pred(parent, 2).
type(ancestor, (person, person)).
type(parent, (person, person)).
direction(ancestor, (in, out)).
direction(parent, (in, out)).
enable_recursion.
max_vars(3).
max_body(2).