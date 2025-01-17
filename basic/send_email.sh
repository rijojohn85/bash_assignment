#!/bin/bash

# SMTP server settings for Gmail
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USERNAME=$GMAIL_ADDRESS
SMTP_PASSWORD=$GMAIL_PASSWORD

# Recipient email address
TO=$GMAIL_ADDRESS

# Email subject and body
SUBJECT=$1
BODY=$2

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
