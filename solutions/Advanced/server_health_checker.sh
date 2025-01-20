#!/bin/bash

cpu_load=$(top -b -n1 | grep Cpu | awk -F "," '{print 100-int($4)}')
echo "CPU load: $cpu_load %"
if [ $cpu_load -gt 80 ]; then
  SUBJECT="CPU Utilisization exceeds 80%"
  BODY="CPU Utilisization has exceeded 80%"
  ../helper_files/send_email.sh "$SUBJECT" "$BODY"
fi

mem_percent=$(free | grep Mem | awk '{print int($7/$2 * 100.0)}')

echo "Mem Free %: $mem_percent"

if [ $mem_percent -lt 20 ]; then
  SUBJECT="Free Memory is less than 20%"
  BODY="Free Memory is less than 20%"
  ../helper_files/send_email.sh "$SUBJECT" "$BODY"
fi

no_failed_services=$(systemctl list-units --state failed | grep failed | wc -l)

if [ $no_failed_services -gt 0 ]; then
  SUBJECT="Services have failed"
  BODY=$(systemctl list-units --state failed)
  ../helper_files/send_email.sh "$SUBJECT" "$BODY"
else
  echo "All services are running."
fi
