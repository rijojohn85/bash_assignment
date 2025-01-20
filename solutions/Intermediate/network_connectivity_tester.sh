#!/bin/bash
file=$1
if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi

while IFS= read -r line; do
  ping -c1 $line &>/dev/null && echo "$line is reachable" || echo "$line is not reachable"
done <$file
