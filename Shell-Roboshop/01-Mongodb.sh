#!/bin/bash

LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LOGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOG_FILE="$LOGS_FOLDER/$0.log"

USERID=$(id -u)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
if [ $SUPERID -ne 0 ]; then
    echo  "$TIMESTAMP [ERROR] Please run this script with root access"  | tee -a $LOG_FILE
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]; then
        echo "$TIMESTAMP [ERROR] $2....FAILURE" | tee -a $LOG_FILE
        exit 1
    else
        echo "$TIMESTAMP [INFO] $2....SUCCESS" | tee -a $LOG_FILE
    fi

}

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Adding Mongo rrepo"