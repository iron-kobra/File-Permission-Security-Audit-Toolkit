#!/bin/bash

echo "Check your working eligibility"

read -p "What is your age : " age

if [ $age -ge 18 ] && [ $age -le 60 ]
then
	echo "You can work"
else
	echo "Sorry you can't work"
	echo "Take some rest"
fi
