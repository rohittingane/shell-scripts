#!/bin/bash

echo "Current user:"
whoami

echo "Current path:"
pwd

echo "Files in folder:"
ls

echo "Disk usage:"
df -h

echo "Memory usage:"
free -m

echo "Running processes:"
ps aux | head
