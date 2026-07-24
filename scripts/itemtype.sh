#!/bin/bash

for item in *
do
  if [ -f "$item" ]
  then
    echo "file: $item"
else
    echo "folder: $item"
fi
done
