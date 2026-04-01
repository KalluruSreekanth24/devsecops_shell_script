#!/bin/bash
echo "script name : $0"
echo "current directory : $PWD"
echo "who is running this script : $USER"
echo " home directory of user : $HOME"
echo "pid of this script : $$"
sleep 5 &
echo "pid of the last command in the background : $!"