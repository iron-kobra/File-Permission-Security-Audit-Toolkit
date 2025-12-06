#!/bin/bash

OUTPUT="../output/recommendations.txt"
mkdir -p ../output

INSECURE="../output/insecure_permissions.txt"
WORLD="../output/world_writable.txt"
WEAK="../output/weak_script_report.txt"
BROKEN="../output/broken_links.txt"  

echo "===== Security Recommendations =====" > "$OUTPUT"
echo "Generated on: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# 1. Insecure Permissions
if grep -qv "No" "$INSECURE" && [ -s "$INSECURE" ]; then
    echo "1] Insecure Permissions Detected" >> "$OUTPUT"
    echo " - Avoid using chmod 777 on files or directories." >> "$OUTPUT"
    echo " - Use chmod 755 for directories and chmod 644 for files." >> "$OUTPUT"
    echo " - Restrict write access to owner or trusted groups only." >> "$OUTPUT"
    echo "" >> "$OUTPUT"
fi

# 2. World Writable Files
if grep -qv "No" "$WORLD" && [ -s "$WORLD" ]; then
    echo "2] World-Writable Files Found" >> "$OUTPUT"
    echo " - Remove write access for 'others' using: chmod o-w <file>" >> "$OUTPUT"
    echo " - Prevent unauthorized modification by restricting permissions." >> "$OUTPUT"
    echo " - Keep shared directory writeable only if absolutely necessary." >> "$OUTPUT"
    echo "" >> "$OUTPUT"
fi

# 3. Weak Scripts
if grep -qv "No" "$WEAK" && [ -s "$WEAK" ]; then
    echo "3] Weak Scripts Detected" >> "$OUTPUT"
    echo " - Add a proper shebang line: #!/bin/bash" >> "$OUTPUT"
    echo " - Remove dangerous commands like rm -rf, chmod 777, or eval." >> "$OUTPUT"
    echo " - Avoid hardcoded passwords in scripts." >> "$OUTPUT"
    echo " - Quote variables to prevent word-splitting vulnerabilities." >> "$OUTPUT"
    echo "" >> "$OUTPUT"
fi

# 4. Broken Links 
if [ -f "$BROKEN" ] && grep -qv "No" "$BROKEN" && [ -s "$BROKEN" ]; then
    echo "4] Broken Symbolic Links Found" >> "$OUTPUT"
    echo " - Recreate missing target files or remove invalid links." >> "$OUTPUT"
    echo " - Maintain consistent directory structure to avoid broken paths." >> "$OUTPUT"
    echo "" >> "$OUTPUT"
fi

echo "Recommendations generated successfully." >> "$OUTPUT"
