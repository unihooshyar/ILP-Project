#!/bin/sh

docker run --rm -it -v "$PWD/examples":/opt/progol/examples --name cprogol-c cprogol:0.1.0
