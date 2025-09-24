#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with the root privelege"
     exit 1
 fi    

VALIDATION(){
 if [ $1 -ne 0 ]; then
    echo -e "ERROR:: Installing $2...$R is failure $N"
        exit 1
else
    echo -e "Installing $2...$G is success $N"
fi
}
dnf list installed mysql  
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATION $? "MYSQL"
else 
    echo -e "MYSQL already exist...$Y SKIPPING $N"

dnf list installed  Nginx 
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATION $? "Nginx"
else
    echo -e "Nginx already exist...$Y SKIPPING $N"
fi
 
 dnf list installed python3
    if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATION $? "python3"
else
    echo -e "python3 already exists...$Y SKIPPING $N"
 fi