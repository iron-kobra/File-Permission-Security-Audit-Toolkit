#!/bin/bash

a=10
b=20
let sum=$b+$a
((sum++))
echo "The sum of the two numbers are $sum"
echo "The product of the two number are $(($a*$b))"
