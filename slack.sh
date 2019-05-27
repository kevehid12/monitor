#!/bin/bash

logbasedir=~/logs
logdir="$logbasedir"/$(date +%F)
logfile= $logdir/test1.txt

mkdir -p $logdir


tmpfile=/tmp/1212.txt


cut -c 5- /var/log/auth.log | awk '($0 >= from)' from="$(LC_TIME=C date +'%_d %H:%M:%S' -d -1hour)" |grep -i 'Failed:\|failure' > $tmpfile
cat $tmpfile | cut -d " " -f 7,8 > $logfile
#rm $tmpfile

content= $logfile

if [ ! -s "$content" ] 
then
	curl -X POST --data-urlencode 'payload={ "username": "webhookbot", "text": "Failed login has been detected, please check the server for more informaiton", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
else
	echo "try it again"
fi
