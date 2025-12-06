#!/bin/bash

# Asking the user to enter absolute path of the direcory to be scanned

while true
do
        echo "Please enter the absolute path of the directory to be scanned"
        read scan_directory

        if [ -d "$scan_directory" ]
        then
                break
        else
                echo "Invalid path ! please enter the path again"
        fi
done

# Defining the output file

output_file="weak_script_report.txt"

# Generating the head of the weak script report file

echo "Weak script report" >> "$output_file"
echo "Generated on : $(date)" >> "$output_file"
echo "Directory scanned : $scan_directory" >> "$output_file"
echo "------------------------------------------------------" >> "$output_file"

# Checking for missing SHEBANG LINE

echo "" >> "$output_file"
echo "1) Scripts missing SHEBANG LINE" >> "$output_file"
echo "------------------------------------------------------" >> "$output_file"

find "$scan_directory" -type f -name "*.sh" | while read file
do
        first_line=$(head -n 1 "$file")
        if [[ "$first_line" != "#!"* ]]
        then
                echo "$file" >> "$output_file"
        fi
done