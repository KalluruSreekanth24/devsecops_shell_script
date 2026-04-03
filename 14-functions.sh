#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "error:: please proceed with the root user , otherwise this will won't work"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "error :: $2 is not getting installed"
        exit 1
    else
        echo "it is a success , $2 is getting installed"
    fi
}

dnf install mysql -y
validate $? mysql

dnf install nginx -y
validate $? nginx

dnf install python3 -y
validate $? python

