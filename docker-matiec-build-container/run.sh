#!/bin/bash

ARGS=$@

pushd /src
iec2c -I/matiec/lib $ARGS
