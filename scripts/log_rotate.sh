#!/bin/bash

set -euo pipefail

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist!"
    exit 1
fi

COMPRESSED=$(find "$LOG_DIR" -name "*.log" -mtime +7 | wc -l)

echo "Compressing old log files..."

find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \;

echo "Compressed files: $COMPRESSED"

DELETED=$(find "$LOG_DIR" -name "*.gz" -mtime +30 | wc -l)

find "$LOG_DIR" -name "*.gz" -mtime +30 -delete

echo "Deleted files: $DELETED"

echo "Log rotation completed successfully!"
