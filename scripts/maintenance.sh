#!/bin/bash

LOG_FILE="/var/log/maintenance.log"

echo "========================================" >> "$LOG_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Maintenance Started" >> "$LOG_FILE"

# Run Log Rotation
echo "$(date '+%Y-%m-%d %H:%M:%S') - Running Log Rotation" >> "$LOG_FILE"
./log_rotate.sh mylogs >> "$LOG_FILE" 2>&1

# Run Backup
echo "$(date '+%Y-%m-%d %H:%M:%S') - Running Backup" >> "$LOG_FILE"
./backup.sh test_data backups >> "$LOG_FILE" 2>&1

echo "$(date '+%Y-%m-%d %H:%M:%S') - Maintenance Completed" >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"
