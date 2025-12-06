#!/bin/bash

read -p "Enter your marks : " marks

if [ $marks -gt 30 ]
then
	echo "You Passed"
	echo "Good Work"
else 
	echo "You Failed"
fi
