#!/bin/bash

dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi

username=$2

if [ "${#username}" -lt 1 ]; then
  echo "Error: username cannot be empty"
  exit 1
fi

for file in $dir/*; do
  ls -l $file | awk -v username="$username" -v file_path="$file" '{if($3 != username) print file_path}'
done
