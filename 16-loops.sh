#!/bin/bash

Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "httpd" "python3" "nginx")

mkdir -p $LOGS_FOLDER

echo "script started executed at : $(date)" | tee -a $LOGS_FILE



if [ $Userid -ne 0 ]
then
    echo "$R error::please run withroot user$N" | tee -a $LOGS_FILE

    exit 1
else
echo "you are running with root user" | tee -a $LOGS_FILE
fi

VALIDATE (){

if [ $1 -eq 0 ]
then
   echo -e "Installing $2 is $G success $N" | tee -a $LOGS_FILE
else
   echo -e "installing $2 is $R failure $N" | tee -a $LOGS_FILE
   exit 1
fi
}

#for package in ${package[@]}
for package in $@
do
 dnf list installed $package &>>$LOGS_FILE

  if [ $? -ne 0 ]
   then
   echo "Installing the $package is going on"| tee -a $LOGS_FILE
      dnf install $package -y &>>$LOGS_FILE
      VALIDATE $? "$package"
  else
   echo -e "$Y $package is already installed $N" | tee -a $LOGS_FILE
 fi 
done

