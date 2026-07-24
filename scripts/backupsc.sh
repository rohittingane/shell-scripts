#!/bin/bash

if [ -z "$1" ]|| [ -z "$2" ]
 then
 echo "Please provide correct source and destination files"
elif [ -d "$1" ]
 then
 mkdir -p "$2"
 cp -r "$1" "$2"
 echo "backup complted from $1 to $2"
else
 echo "source folder not found: $1"
fi
