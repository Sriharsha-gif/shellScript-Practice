#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S") 

#Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi
#1st arg >> What are you trying to instal
#2nd >> exit code
VALIDATE(){
    if [ $2 -ne 0 ];then
     echo "$TIMESTAM [ERROR] Installing $1 is.........FAILED" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$TIMESTAMP [INFO] Install $1 is ...sucess" | tee -a $LOGS_FILE
    fi

 }
  for package in $@
  do 
   echo "$TIMESTAMP [INFO] Installing $package"
   dnf list installed $package &>> @LOGS_FILE
   if [ $? -ne 0 ]; then
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE "installing $package" $?
  else
    echo -e"$TIMESTAMP [INFO] $package $Y already installed..........Skipping $N"
  fi
  done


