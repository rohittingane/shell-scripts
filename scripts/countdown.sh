#!/bin/bash

count=1

while [ $count -le 5 ]
do
    echo "Check number: $count"
    count=$((count + 1))
done
