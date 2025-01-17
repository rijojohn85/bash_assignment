#!/bin/bash

dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi

find $dir -type f -mtime +6 | xargs tar -zcvf archive.tar.gz &>/dev/null

if [ $? -ne 0 ]; then
  echo "no files older than 7 days were found"
  exit 1
fi

find $dir -type f -mtime +6 -delete
