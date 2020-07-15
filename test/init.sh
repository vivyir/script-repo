#!/bin/bash
echo "launched"
print "if you want dependancies enter y (case sensitive) : "
read dep
if [ "$dep" = "y" ]; then
    echo "good dep"
else
    echo "bad dep"
fi
