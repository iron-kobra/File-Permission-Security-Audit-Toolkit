#!/bin/bash



OUTPUT="../output/insecure_permissions.txt"
FILES="../tests"



# Start report
echo "---Insecure Permission Report---" > "$OUTPUT"
echo "Generated on: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"





# Detect files with 777 permissions

echo "---Files with 777 permissions---:" >> "$OUTPUT"
find "$FILES" -type f -perm 777 2>/dev/null >> "$OUTPUT"
echo "" >> "$OUTPUT"



# Detect directories with 777 permissions
echo "---Directories with 777 permissions---:" >> "$OUTPUT"
find "$FILES" -type d -perm 777 2>/dev/null  >> "$OUTPUT"
echo "" >> "$OUTPUT"



echo "Scan completed. Report saved to $OUTPUT"
