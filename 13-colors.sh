#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"


Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "$R error::please run withroot user$N"
    exit 1
else
echo "you are running with root user"
fi

VALIDATE (){

if [ $1 -eq 0 ]
then
   echo -e "Installing $2 is $G success $N"
else
   echo -e "installing $2 is $R failure $N"
   exit 1
fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "Installing the mysql is going on"
      dnf install mysql -y
      VALIDATE $? "mysql"
else
   echo -e "$Y mysql is already installed $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
   echo "python installation is going on"
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo -e "$Y python installed already"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
   echo "nginx installation is going on"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo -e "$Y nginx is installed already"
fi


















