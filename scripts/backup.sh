#!/bin/bash

# Check source directory argument
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <source_directory> <backup_destination>"
    exit 1
fi

SOURCE=$1
DESTINATION=$2

# Check source directory exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory does not exist"
    exit 1
fi

# Create backup destination if not exists
if [ ! -d "$DESTINATION" ]; then
    mkdir -p "$DESTINATION"
fi

# Create timestamp
DATE=$(date +%Y-%m-%d)

# Backup file name
BACKUP_FILE="backup-$DATE.tar.gz"

# Full backup path
BACKUP_PATH="$DESTINATION/$BACKUP_FILE"

echo "Creating backup..."

# Create tar.gz archive
tar -czf "$BACKUP_PATH" "$SOURCE"

# Verify backup created
if [ -f "$BACKUP_PATH" ]; then
    echo "Backup created successfully"
    echo "Archive Name: $BACKUP_FILE"
    echo "Archive Size:"
    ls -lh "$BACKUP_PATH"
else
    echo "Backup failed"
    exit 1
fi

# Delete backups older than 14 days
echo "Deleting old backups..."

find "$DESTINATION" -name "backup-*.tar.gz" -mtime +14 -delete

echo "Old backups deleted"
echo "Backup process completed successfully!"
