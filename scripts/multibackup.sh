#!/bin/bash

for folder in my-app assign-devops devops-cicd-project
do
    if [ -d "$folder" ]
    then
        mkdir -p backups
        cp -r "$folder" backups
        echo "Backup done for: $folder"
    else
        echo "Folder missing: $folder"
    fi
done
