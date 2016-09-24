#!/bin/sh

# load CSS first to avoid the issue of out of memory
echo 1 > /sys/devices/8200000.css/load
CSS_LOAD_CNT=0
while [ "$CSS_LOAD_CNT" -le 10 -a "`cat /sys/bus/platform/devices/8200000.css/state`" != "loaded" ]
do
        sleep 1
        CSS_LOAD_CNT=$(($CSS_LOAD_CNT+1))
done

