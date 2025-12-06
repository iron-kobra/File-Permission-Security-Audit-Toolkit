#!bin/bash

for i in 1 2 3 4 5 6 7 8 9 10
do
	if [ $((i%2)) -eq 1 ]
	then
		echo "odd"
	else
		echo "even"
	fi
done

