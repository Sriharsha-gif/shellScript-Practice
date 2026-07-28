#!/bin/bash 

USERID=$(id -u)

#Check root access or not 
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi 
#1st Arg - What are you trying to install
#2nd Arg - exit ocde
VALIDTAE (){
    if [ $? -ne 0 ]; then
        echo "Installing MYSQL is ..........Failed"
        exit 1
else
    echo " Installing MYSQL is .........SUCCESS"
fi

}


#
dnf list installed Mysql

if [ $? -ne 0 ];then 

echo "MYSQL is Already Install....SKIPPED"
else 
echo "Installing MySQl"
dnf install mysql -y
VALIDATE MYSQL $?
fi

dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx ia already installed....Skipping"
else
    echo "installing ngonx"
    dnf install ngnix -y
VALIDATE MySQl $?
fi