#!/bin/bash

output=$(df -h | awk 'int($5)>=10 {print $0}')

if [ "${#output}" -gt 0 ]; then
  df -h | awk 'int($5)>=10 {print $0}'
  # SMTP server settings for Gmail
  SMTP_SERVER="smtp.gmail.com"
  SMTP_PORT="587"
  SMTP_USERNAME=$GMAIL_ADDRESS
  SMTP_PASSWORD=$GMAIL_PASSWORD

  # Recipient email address
  TO=$GMAIL_ADDRESS

  # Email subject and body
  SUBJECT="Disk Utilisization exceeds 80%"
  BODY="Below drives exceed 80% Utilisization\n$output \n\n check df -h."

  # Construct the email message
  MESSAGE="Subject: $SUBJECT\n\n$BODY"

  # Send the email using Curl
  curl --url "smtp://$SMTP_SERVER:$SMTP_PORT" \
    --ssl-reqd \
    --mail-from "$SMTP_USERNAME" \
    --mail-rcpt "$TO" \
    --user "$SMTP_USERNAME:$SMTP_PASSWORD" \
    --tlsv1.2 \
    -T <(echo -e "$MESSAGE")

  echo "Email sent to $TO"
fi
