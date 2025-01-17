#!/bin/bash

dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi

find $dir -type f -name "*.txt" ! -perm 0644 | xargs chmod 0644 &>/dev/null
