#!/bin/bash

count=1

while [ $count -le 3 ]
do
    echo "Health check attempt: $count"

    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)

    if [ $response -eq 200 ]
    then
        echo "App is UP ✅"
    else
        echo "App is DOWN ❌"
    fi

    count=$((count + 1))
    sleep 2
done
