#!/bin/bash 
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder=/var/log/shell-script
script_name=$( echo $0 | cut -d "." -f1 )
logfile="$logs_folder/$script_name.log"
mkdir -p $logs_folder
echo "Script started executed at: $(date)" | tee -a $logfile

if [ $userid -ne 0 ]; then
    echo "error:: please proceed with the root user"
    exit 1
fi
validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$R error:: $Y not installing the $2 $N" |  tee -a $logfile
        exit 1
    else 
        echo -e "$G success:: $2 is installed $N" | tee -a $logfile
    fi
}

dnf list installed mysql &>>$logfile
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$logfile
    validate $? mysql
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $logfile

fi
dnf list installed nginx &>>$logfile
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$logfile
    validate $? nginx
else
    echo -e "nginx already exist ... $Y SKIPPING $N" | tee -a $logfile

fi
