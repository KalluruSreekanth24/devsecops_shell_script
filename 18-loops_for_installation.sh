#!/bin/bash
userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_1_folder="/var/log/shell_script_1"
script_name=$( echo "$0" | cut -d "." -f1 )
logfile2="$logs_1_folder/$script_name.log"

mkdir -p $logs_1_folder
echo "Script started executed at: $(date)" | tee -a $logfile2


if [ $userid -ne 0 ]; then
    echo "error:: please proceed with the root user"
    exit 1
fi

validate(){
    if [ $? -ne 0 ]; then
        echo -e "$R error:: $Y not installing the $2 $N" |  tee -a $logfile2

        exit 1
    else 
        echo -e "$G success:: $2 is installed $N" | tee -a $logfile2

    fi
}

for pack in $@
do
    dnf list installed $pack &>>$logfile2
    if [ $? -ne 0 ]; then
        dnf install $pack -y &>>$logfile2
        validate $? "$pack"
    else
        echo -e "$pack already installed ... $Y SKIPPING $N"
    fi
done
