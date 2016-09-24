#!/bin/sh

UPTIME="$(($(cat /proc/uptime|cut -d' ' -f1 |cut -d'.' -f1)/60))"
MINTIME="$( nvram help 193 | cut -d' ' -f9 | cut -d'=' -f2)"
if [ "`nvram get 194`" = "3" -a ${UPTIME} -ge ${MINTIME} ]; then
    /sbin/provision 
elif [ ${UPTIME} -gt 5 ]; then
    /sbin/provision 
fi    

