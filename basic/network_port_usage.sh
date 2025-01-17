#!/bin/bash

port_number=$1

number_of_processes=$(lsof -i tcp:${port_number} | wc -l)

if [ $number_of_processes -gt 0 ]; then
  lsof -i tcp:$port_number | awk 'NR!=1 {print $1}'
fi

## to stop the process
# $(lsof -i tcp:${port_number} | awk 'NR!=1 {print $2}' | xargs kill -9)
