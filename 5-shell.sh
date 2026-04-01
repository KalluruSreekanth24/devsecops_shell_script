#!/bin/bash
start=$(date +%s)
sleep 5
end=$(date +%s)
echo "the time gap between 1st command and second command is $(($end-start))"

