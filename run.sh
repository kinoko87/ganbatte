#! /bin/bash
args=$@
if [ $# -eq 0 ]; then
    args="linux -debug"
fi
openfl test $args