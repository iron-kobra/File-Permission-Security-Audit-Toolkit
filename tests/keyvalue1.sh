#!/bin/bash

declare -A myarray
myarray=( [name]=Atin [age]=18 )

echo "${myarray['name']}"
