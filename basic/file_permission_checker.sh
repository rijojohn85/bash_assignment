#!/bin/bash

parse_perm() {
  perm=$1
  perm_read="No"
  perm_write="No"
  perm_x="No"
  if [[ $perm == *r* ]]; then
    perm_read="Yes"
  fi
  if [[ $perm == *w* ]]; then
    perm_write="Yes"
  fi
  if [[ $perm == *x* ]]; then
    perm_x="Yes"
  fi
  echo "Read-$perm_read, Write-$perm_write, Execute-$perm_x"
}

file=$1

if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi
permissions=$(ls -l $file | awk '{print $1}')

#owner
owner=$(echo $permissions | awk '{print substr($1, 2, 3)}')
echo "Owner: $(parse_perm $owner)"

#group
group=$(echo $permissions | awk '{print substr($1, 5, 3)}')
echo "Group: $(parse_perm $group)"
#others
others=$(echo $permissions | awk '{print substr($1, 8, 3)}')
echo "Others: $(parse_perm $others)"
