#!/bin/bash
file=$1
if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi
threshold=$2

size=$(du -k $file | cut -f1)
echo "File size: $size KB"

if [ $size -gt $threshold ]; then
  echo "Warning: File size exceeds threshold of $threshold KB"
fi
