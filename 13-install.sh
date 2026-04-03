#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "error :: proceed with the root user , otherwise it won't work"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "error:: not installing the mysql"
    exit 1
else 
    echo "installing the mysql is success"
fi