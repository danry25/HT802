#!/bin/sh

TINY_LCD_MODELS="GXP1400"
DEV_ALIAS="`cat /proc/gxp/dev_info/dev_alias`"
TINY_LCD="0"
#if [ -n "`echo $TINY_LCD_MODELS | grep $DEV_ALIAS`" ]; then
#    TINY_LCD="1"
#fi

SMALL_LCD_MODELS="GXP1400 GXP1450 ET625"
SMALL_LCD="0"
#if [ -n "`echo $SMALL_LCD_MODELS | grep $DEV_ALIAS`" ]; then
#    SMALL_LCD="1"
#fi

WAN_DEVICE="`nvram get wan_device`"
DEVICEIP="`ifconfig $WAN_DEVICE | grep 'inet addr' | sed -e 's/ *inet addr:\([0-9\.]*\) *Bcast.*/\1'/`"

#Cleanup
WAN_DEVICE=""
DEV_ALIAS=""

