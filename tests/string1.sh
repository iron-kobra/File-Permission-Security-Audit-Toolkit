#!/bin/bash 

var="hey how are you, hope you are doing well"

echo "The length of the variable is ${#var}"
echo "Upper Case --- ${var^^}"
echo "Lower Case --- ${var,,}"
echo "Replace hey with hlo --- ${var/hey/hlo}"
echo "Slice of the string --- ${var:4:11}"
