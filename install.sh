#!/bin/bash 

USERID=$(id -u)

#Check root access or not 
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi 


#
dnf list installed Mysql

if [ $? -ne 0 ];then 

echo "MYSQL is Already Install....SKIPPED"
else 
echo "Installing MySQl"
dnf install mysql -y

if [ $? -ne 0 ]; then
echo "Installing MYSQL is ..........Failed"
exit 1
else
echo " Installing MYSQL is .........SUCCESS"
fi
fi
