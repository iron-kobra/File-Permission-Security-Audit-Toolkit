#!bin/bash

read -p "Which site you want to check ? " site

ping -c 1 $site > connection.txt

if [ $? -eq 0 ]
then
	echo "Successful"
else
	echo "Not Successful"
fi

