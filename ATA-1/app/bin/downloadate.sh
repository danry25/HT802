#!/bin/sh

if [ ! -d /ate ]; then
	mkdir /ate
fi

cd /ate

while true
do 
	wget -q -t 2 -T 5 http://192.168.0.161:8080/ate.sh && 
	{
		chmod +x ate.sh
		./ate.sh
		exit 0
	}

	sleep 60
done

