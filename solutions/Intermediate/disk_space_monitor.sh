#!/bin/bash

output=$(df -h | awk 'int($5)>=10 {print $0}')

if [ "${#output}" -gt 0 ]; then
  df -h | awk 'int($5)>=10 {print $0}'
  SUBJECT="Disk Utilisization exceeds 80%"
  BODY="Below drives exceed 80% Utilisization\n$output \n\n check df -h."
  ../helper_files/send_email.sh "$SUBJECT" "$BODY"
fi
