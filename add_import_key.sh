#!/bin/bash

if [ 3 -ne $# ]; then
	echo "$0 <docker-compose.yml> <private key> <address>"
	exit
fi

filename=$1
pk=$2
address=$3

contents=""
IFS=''
while read -r line; do
	if [[ `echo $line | grep "tail -F klaytn/log/kcnd.out"` ]]; then
		contents+="        sleep 1\n"
		contents+="        ken attach --exec \"personal.importRawKey('$pk','')\" http://localhost:8551\n"
		contents+="        ken attach --exec \"personal.unlockAccount('$address','', 999999999)\" http://localhost:8551\n"
	fi
	contents+="$line\n"
done < "$filename"

echo -e $contents > $filename