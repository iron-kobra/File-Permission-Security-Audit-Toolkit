#!/bin/bash

OUTPUT_DIR="./output"
OUTPUT_FILE="$OUTPUT_DIR/broken_links.txt"

mkdir -p "$OUTPUT_DIR"

echo "=== Broken Link Checker Report ===" > "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "[All Symbolic Links]" >> "$OUTPUT_FILE"
find /home/rishi/project/test_links -type l 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "[Broken Links]" >> "$OUTPUT_FILE"
find /home/rishi/project/test_links -xtype l 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

BROKEN_COUNT=$(find /home/rishi/project/test_links -xtype l 2>/dev/null | wc -l)
echo "Total Broken Links: $BROKEN_COUNT" >> "$OUTPUT_FILE"

echo "Report Saved To: $OUTPUT_FILE"



