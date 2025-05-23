#!/bin/bash

USERID=$(id-u)

if [ $USERID -ne 0 ]
then
   echo "Error:: please run with root access"
   exit 1
else
   echo "already running with root user"
fi

dnf list mysql installed

if [ $? -ne 0 ]
then 
    echo "mysql is not installed it is going to install"
    dnf install mysql -y
    if [ $? -eq 0 ] 
    then
        echo "mysql installation is success"
    else
       echo "mysql installation is failure"
       exit 1
    fi   
else
   echo "mysql installation is already completed nothing to do"
fi   