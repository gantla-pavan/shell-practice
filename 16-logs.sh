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
 echo "script started executed at $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with the root privelege"
     exit 1 # fialure is other than 0
fi

VALIDATE(){
 if [ $1 -ne 0 ]; then
    echo -e "ERROR:: Installing $2...$R is failure $N"
        exit 1
else
    echo -e "Installing $2...$G is success $N"
fi
}
dnf list installed mysql &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOGS_FILE
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL already exist...$Y SKIPPING $N"
fi

dnf list installed  Nginx &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOGS_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist...$Y SKIPPING $N"
fi

 dnf list installed python3 &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOGS_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 already exists...$Y SKIPPING $N"
fi