#!/bin/bash
read -p "enter the given number : " number
if [ $(($number%2)) -eq 0 ]; then
    echo "the given number is even number : $number"
else
    echo "the given number is odd number : $number"
