#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with the root privelege"
     exit 1
 fi    

VALIDATION(){
 if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 is failure"
    exit 1
else
    echo "Installing $2 is success"
fi
}
dnf installing mysql -y
VALIDATION $? "MYSQL"

dnf installing nginx -y
 VALIDATION $? "Nginx"
 

dnf install mongodb-mongosh -y
Vlidation $? "Mongosh

