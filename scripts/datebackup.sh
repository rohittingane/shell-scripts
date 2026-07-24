#!/bin/bash

today=$(date +%F)

for folder in my-app assign-devops devops-cicd-project
do
    if [ -d "$folder" ]
    then
        mkdir -p "backups-$today"
        cp -r "$folder" "backups-$today"
        echo "Backup done for: $folder into backups-$today"
    else
        echo "Folder missing: $folder"
    fi
done
