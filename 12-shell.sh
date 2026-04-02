#!/bin/bash
user=$(id -u)
if [ $user -ne 0 ]; then
    echo "error:: proceed with the root user"
    exit 120
fi

dnf install mysql-server -y
if [ $? -ne 0 ]; then
    echo "error:: stopping the process because previous command failed"
    exit 100
else
    echo "installing mysql server"
fi