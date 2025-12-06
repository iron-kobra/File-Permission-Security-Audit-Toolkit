#!/bin/bash

OUTPUT="../output/audit_report.txt"
mkdir -p ../output

INSECURE="../output/insecure_permissions.txt"
WORLD="../output/world_writable.txt"
WEAK="../output/weak_script_report.txt"
BROKEN="../output/broken_links.txt"
RECOM="../output/recommendations.txt"

echo "===== FILE PERMISSION & SECURITY AUDIT REPORT =====" > "$OUTPUT"
echo "Generated on: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "[1] Insecure Permissions" >> "$OUTPUT"
if [[ -f "$INSECURE" ]]; then
    cat "$INSECURE" >> "$OUTPUT"
else
    echo "No insecure permissions found." >> "$OUTPUT"
fi
echo "" >> "$OUTPUT"


echo "[2] World-Writable Files" >> "$OUTPUT"
if [[ -f "$WORLD" ]]; then
    cat "$WORLD" >> "$OUTPUT"
else
    echo "No world-writable files found." >> "$OUTPUT"
fi
echo "" >> "$OUTPUT"


echo "[3] Weak Scripts" >> "$OUTPUT"
if [[ -f "$WEAK" ]]; then
    cat "$WEAK" >> "$OUTPUT"
else
    echo "No weak scripts found." >> "$OUTPUT"
fi
echo "" >> "$OUTPUT"


echo "[4] Broken Symbolic Links" >> "$OUTPUT"
if [ -f "$BROKEN" ]; then
    cat "$BROKEN" >> "$OUTPUT"
else
    echo "No broken links found or module not ready." >> "$OUTPUT"
fi
echo "" >> "$OUTPUT"


echo "[5] Security Recommendations" >> "$OUTPUT"
if [ -s "$RECOM" ]; then
    cat "$RECOM" >> "$OUTPUT"
else
    echo "Recommendations not generated yet." >> "$OUTPUT"
fi
echo "" >> "$OUTPUT"


echo "===== END OF REPORT =====" >> "$OUTPUT"
