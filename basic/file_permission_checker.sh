#!/bin/bash

file=$1

if [ ! -f $file ]; then
  echo "Error: File not found"
  exit 1
fi
permissions=$(ls -l $file | awk '{print $1}')

#owner
owner=$(echo $permissions | awk '{print substr($1, 2, 3)}')
owner_read="No"
owner_write="No"
owner_x="No"
if [[ $owner == *r* ]]; then
  owner_read="Yes"
fi
if [[ $owner == *w* ]]; then
  owner_write="Yes"
fi
if [[ $owner == *x* ]]; then
  owner_x="Yes"
fi
echo "Owner: Read-$owner_read, Write-$owner_write, Execute-$owner_x"

#group
group=$(echo $permissions | awk '{print substr($1, 5, 3)}')
group_read="No"
group_write="No"
group_x="No"
if [[ $group == *r* ]]; then
  group_read="Yes"
fi
if [[ $group == *w* ]]; then
  group_write="Yes"
fi
if [[ $group == *x* ]]; then
  group_x="Yes"
fi
echo "Group: Read-$group_read, Write-$group_write, Execute-$group_x"

#others
others=$(echo $permissions | awk '{print substr($1, 8, 3)}')
others_read="No"
others_write="No"
others_x="No"
if [[ $others == *r* ]]; then
  others_read="Yes"
fi
if [[ $others == *w* ]]; then
  others_write="Yes"
fi
if [[ $others == *x* ]]; then
  others_x="Yes"
fi
echo "Others: Read-$others_read, Write-$others_write, Execute-$others_x"
