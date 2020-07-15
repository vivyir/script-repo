#!/bin/bash
echo "launched"
if [ "$1" = "dep" ]; then
    echo "good dep"
else
    echo "bad dep"
fi
