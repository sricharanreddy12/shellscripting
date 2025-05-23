#!/bin/bash

echo "All variables are passed to the script:$@"
echo "number of variables are passed:$#"
echo "script name:$0"
echo "current directory :$PWD"
echo "home directory of the user :$HOME"
echo " who is the current user running script : $USER"
echo "Pid of the script :$$"
sleep 10 &
echo "Pid of the last command is background :$!"
