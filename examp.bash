#!/bin/bash

echo "$(tput setab 2) Welcome $HOSTNAME $(tput sgr 0)"
echo ""
hs="$(echo $HOSTNAME)"
ip="$(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')"

echo "$(tput setaf 2)[1][Directory Generator] $(tput sgr 0)"

echo "$(tput setaf 2)[2][Log Clear](Root) $(tput sgr 0)"

echo "$(tput setaf 2)[3][Display Server Stats] $(tput sgr 0)"



echo ""
echo -n "atc0.1 --> $ "


read character


if [ "$character" = "1" ]; then
	echo -n "Enter directory name ->"
	read dir
	if [ -d "$dir" ]
	then
	echo "Directory exists"
	else
	`mkdir $dir`
	echo "Directory created"
	fi
fi

if [ "$character" = "2" ]; then
	LOG_DIR=/var/log
	cd $LOG_DIR

	cat /dev/null > messages
	cat /dev/null > wtmp
	echo "Logs cleaned up."
fi

if [ "$character" = "3" ]; then
    	date
	echo "uptime:"
	uptime
	echo "Currently connected:"
	w
	echo "--------------------"
	echo "Last logins:"
	last -a | head -3
	echo "--------------------"
	echo "Disk and memory usage:"
	df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
	free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'
	echo "--------------------"
fi
