#!/bin/bash
file=$1
if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi

grep -i "error" $file | awk -F ":" '{count[$2]++} END {for (word in count) print word, count[word]}'
