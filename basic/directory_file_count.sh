#!/bin/bash

dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi

files=$(find $dir -type f | wc -l)
directories=$(find $dir -type d | wc -l)

echo "Files: $files, SubDirectories: $(expr $directories - 1)"
