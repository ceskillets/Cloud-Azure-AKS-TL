#!/bin/sh

while true
do
  STATUS=$(curl -k -s -o /dev/null -w "%{http_code}\n" -X GET https://$1:8083/api/v1/_ping)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! Twistlock Console is UP"
    break
  else
    echo "Got $STATUS! Twistlock Console is NOT UP YET"
  fi
  sleep 2
done