#!/bin/bash

echo "please enter your choice"
echo "a for date"
echo "b for listing all the files in the directory"

read choice

case $choice in
	a) 
		date
		echo "Ya a really good day to go on a date";;
	b) ls;;
	*) echo "Not a valid input"
esac
