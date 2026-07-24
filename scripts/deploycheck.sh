#!/bin/bash

if [ -z "$1" ]
  then
  echo "Please provide config file name"
elif [ -f "$1" ]
  then
  echo "config file found, ready to deploy"
else
  echo "config file missing"
fi

