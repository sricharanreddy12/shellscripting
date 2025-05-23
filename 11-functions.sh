#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "error::please run withroot user"
    exit 1
else
echo "you are running with root user"
fi

VALIDATE (){

if [ $1 -eq 0 ]
then
   echo "Installing $2 is success"
else
   echo "installing $2 is failure"
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
   echo "mysql is already installed"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
   echo "python installation is going on"
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo "python installed already"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
   echo "nginx installation is going on"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo "nginx is installed already"
fi


















