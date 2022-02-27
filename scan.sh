#!/bin/bash

echo -e "CIDR file: $1 | rate: $2 (pps) | timeout: $3 | portlist: $4"

RESDIR="results"

while true
do
	if [[ -f "paused.conf" ]]; then
		timeout -s SIGINT $3 masscan --resume paused.conf
		echo -e "timeout exceeded, sleeping for next 3 seconds"
		sleep 3
		masscan --readscan $1_result.bin -oX $RESDIR/$(basename $1).xml
		masscan --readscan $1_result.bin -oG $RESDIR/$(basename $1).txt
		echo -e "github push..."
		git add --all $RESDIR/
		git commit -m "scan results update"
		git push -u origin main
	else
		timeout -s SIGINT $3 masscan -iL $1 -p$4 --rate=$2 -oB $1_result.bin
		echo -e "timeout exceeded, sleeping for next 3 seconds"
		sleep 3
		masscan --readscan $1_result.bin -oX $RESDIR/$(basename $1).xml
		masscan --readscan $1_result.bin -oG $RESDIR/$(basename $1).txt
		echo -e "github push..."
		git add --all $RESDIR/
		git commit -m "scan results update"
		git push -u origin main
	fi
done
exit 0
