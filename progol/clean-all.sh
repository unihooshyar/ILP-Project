#!/bin/sh

docker stop cprogol-c

docker rm -f cprogol-c

docker image rm -f cprogol:0.1.0
