#!/bin/bash

grep -i "PAM:chauthtok grantors" /var/log/audit/audit.log > /tmp/breakinattempts.txt
cat /tmp/breakinattempts.txt | cut -d " " -f 10 > /tmp/12.txt

echo "login failure has been detected."

content= $logfile

if [ -s /tmp/12.txt ] 
then
	curl -X POST --data-urlencode 'payload={ "username": "webhookbot", "text": "Failed login has been detected, please check the server for more informaiton", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
else
	echo "not malicious"
fi
