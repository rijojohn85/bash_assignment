#!/bin/bash
file=$1
if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi

if [ ! -s $file ]; then
  echo "File is empty"
  exit 1
fi

sort $file | uniq >uniqueFile
