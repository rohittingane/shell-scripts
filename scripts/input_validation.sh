#!/bin/bash

# Step 1: Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Error: No log file provided."
    echo "Usage: $0 <path-to-log-file>"
    exit 1
fi

LOG_FILE="$1"

# Step 2: Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

echo "Log file '$LOG_FILE' found. Proceeding with analysis..."


# Task 2: Error Count
ERROR_COUNT=$(grep -cE "ERROR|Failed" "$LOG_FILE")
echo "Total Error Count: $ERROR_COUNT"

# Task 3: Critical Events
echo ""
echo "--- Critical Events ---"
grep -n "CRITICAL" "$LOG_FILE" | sed -E 's/^([0-9]+):/Line \1: /'


# Task 4: Top 5 Error Messages
echo ""
echo "--- Top 5 Error Messages ---"
TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5)
echo "$TOP_ERRORS"

# Task 5: Summary Report generate kara
TODAY=$(date +%Y-%m-%d)
REPORT_FILE="log_report_${TODAY}.txt"
TOTAL_LINES=$(wc -l < "$LOG_FILE")
CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_FILE" | sed -E 's/^([0-9]+):/Line \1: /')

echo "Log Analysis Report" > "$REPORT_FILE"
echo "Date: $TODAY" >> "$REPORT_FILE"
echo "Log File: $LOG_FILE" >> "$REPORT_FILE"
echo "Total Lines Processed: $TOTAL_LINES" >> "$REPORT_FILE"
echo "Total Error Count: $ERROR_COUNT" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "--- Top 5 Error Messages ---" >> "$REPORT_FILE"
echo "$TOP_ERRORS" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "--- Critical Events ---" >> "$REPORT_FILE"
echo "$CRITICAL_EVENTS" >> "$REPORT_FILE"

echo ""
echo "Report generated: $REPORT_FILE"

# Task 6: Archive processed log
mkdir -p archive
mv "$LOG_FILE" archive/
echo "Log file archived to archive/$LOG_FILE"
