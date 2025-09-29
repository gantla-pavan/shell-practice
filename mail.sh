#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
MESSAGE_BODY=$4
FORMATED_BODY=$(printf '%s\n'"$MESSAGE_BODY" | sed -e "s/'/'\\\\''/g; ls/^/'/; \$s/\$/'/")
IP_ADDRESS=$5
To_TEAM=$6

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALER_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/MESSAGE/$FORMATED_BODY/g" template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"