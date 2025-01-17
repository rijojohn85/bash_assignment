#!/bin/bash

dir=$1

if [ ! -d $dir ]; then
  echo "Error: Directory not found"
  exit 1
fi

find $dir -xtype l
