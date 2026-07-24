#!/bin/bash

for file in *.sh
do
    if [ -f "$file" ]
    then
        echo "Valid script file: $file"
    fi
done
