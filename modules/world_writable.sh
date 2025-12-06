#!/bin/bash

OUTPUT="output/world_writable.txt"
mkdir -p output

find ~/modules/tests/sample_test_files -type f -perm -002 | while read file
do
    ls -l "$file" >> "$OUTPUT"
done

