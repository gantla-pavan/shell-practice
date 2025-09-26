#!/bin/bash

USERID=$(id -u)
    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"
    N="\e[34m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"
 echo "script started executed at $(date)" | tee -a $LOGS_FILE 

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with the root privelege"
     exit 1 # fialure is other than 0
fi

VALIDATE(){
 if [ $1 -ne 0 ]; then
    echo -e "Installing $2...$R is FAILURE $N" | tee -a $LOGS_FILE

        exit 1
else
    echo -e "Installing $2...$G is SUCCESS $N" | tee -a $LOGS_FILE

fi
}

#$@

for package in $@
do
    #check package is installed or not
    dnf installed $package &>>$LOGS_FILE

    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo -e "$package is already installed ...$Y SKIPPING $N""

done