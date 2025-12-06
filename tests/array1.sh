#!/bin/bash

#Arrays

myarray=( 1 10.5 Atin "Atin Gourav" hello )
echo "${myarray[2]}"

echo "All the values in the array are ${myarray[*]}"
echo "Values from index 1-3 ${myarray[*]:1:3}"

myarray+=( 9.3 cgpa )
echo "current array ${myarray[*]}"

myarray[1]=10
echo "all array values ${myarray[*]}"

unset myarray[1]
echo "all array values ${myarray[*]}"
