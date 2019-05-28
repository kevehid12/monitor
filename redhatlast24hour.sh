#!/bin/bash
# last 24 hour of monitoring of failed login
ausearch --message USER_LOGIN --success no -ts yesterday -te now -i > /tmp/breakinattempts.txt
cat /tmp/breakinattempts.txt | cut -d " " -f 10 > /tmp/12.txt

echo "login failure has been detected."

content= $logfile

if [ -s /tmp/12.txt ] 
then
	curl -X POST --data-urlencode 'payload={ "username": "webhookbot", "text": "Failed login has been detected in the last 24 hours, please check the server for more informaiton", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
else
	echo "not malicious"
fi

rm /tmp/12.txt
rm /tmp/breakinattempts.txt
