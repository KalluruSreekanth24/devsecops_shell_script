#!/bin/bash
number=$1
if [ $number -lt 10 ]; then
    echo "the given number is less than 10"
elif [ $number -eq 10 ]; then
    echo "given number is equal to 10"
else
    echo "the given number is greater than 10"
fi