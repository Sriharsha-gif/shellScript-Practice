#! /bin/bash

##--------------------Special Variables ------------------------##

echo "All variables passed to Script : $@"
echo "Number of Variables Passed : $#"
echo "Frist variable : $1"
echo "Script Name : $0"
echo "Who is running the Script : $USER"
echo "Which Directory : $PWD"
echo "Home Directory : $HOME"
echo "PID of the Current Script : $$"
sleep 3 & 
echo "PID of theBackground Cammand Running Just Now : $!"
wait $!
echo "Line Number : $LINENO"
echo "Script Executed in $SECONDS Seconds"