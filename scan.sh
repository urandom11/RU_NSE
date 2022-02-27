#!/bin/bash

echo -e "CIDR file: $1 | rate: $2 (pps) | timeout: $3"

while true
do
	if [[ -f "paused.conf" ]]; then
		timeout -s SIGINT $3 masscan --resume paused.conf
		echo -e "timeout exceeded, sleeping for next 3 seconds"
		sleep 3
		masscan --readscan $1_result.bin -oX $1_result.xml
		masscan --readscan $1_result.bin -oG $1_result.txt
	else
		timeout -s SIGINT $3 masscan -iL $1 -p3389,80,443 --rate=$2 -oB $1_result.bin
		echo -e "timeout exceeded, sleeping for next 3 seconds"
		sleep 3
		masscan --readscan $1_result.bin -oX $1_result.xml
		masscan --readscan $1_result.bin -oG $1_result.txt
	fi
done
