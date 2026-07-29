#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" 

#Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi
#1st arg >> What are you trying to instal
#2nd >> exit code
VALIDATE(){
    if [ $2 -ne 0 ];then
     echo "Installing $1 is.........FAILED"
        exit 1
    else
        echo "Install $1 is ...sucess"
    fi

 }
  for package in $@
  do 
   echo " Installing $package"
   dnf list installed $package
   if [ $? -ne 0 ]; then
    dnf install $package -y &..$LOGS_FILE
    VALIDATE $package $?
  else
    echo "$package already installed..........Skipping"
  fi
  done


