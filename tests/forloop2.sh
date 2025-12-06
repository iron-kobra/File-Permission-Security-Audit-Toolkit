#!/bin/bash

items="items.txt"

for item in $(cat $items)
do
	echo "Number is : $item"
done

