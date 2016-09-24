#!/bin/sh

MAC="`nvram get 67|tr -d ':'`"
VER="`nvram get 68`"
TIME="`date +%s`"
HAS_DECT=0
NEEDS_FACT_EEPROM=0

#core dump enabled 
ulimit -c 32000000

/etc/init.d/slic start

#if [ "`nvram get 208`" == "1" ]; then
    #Enable only for syslog level DEBUG
    #if [ -f "/proc/gxp/dev_info/hw_features/model_str" ]; then
        #sendlog "`cat /proc/gxp/dev_info/dev_alias`_CORE" /proc/kmsg "`cat /proc/gxp/dev_info/dev_alias`" 3 &
        #sendlog "`cat /proc/gxp/dev_info/dev_alias`_DSP" /dev/cordless &
    #else
        #sendlog GXPCORE /proc/kmsg GXP 3 &
        #sendlog GXPDSP /dev/cordless &
    #fi
#    sendlog "`nvram get :syslog_id` DSP " /dev/cordless &
#elif [ "`nvram get 208`" == "5" ]; then	
#    sendlog "<6> `nvram get :syslog_id` DSP " /dev/cordless &
#fi
#fi

#if [ -f /proc/gxp/dev_info/hw_features/dect ]; then
#    if [ -z "`nvram get rf_test`" ]; then
#        nvram set rf_test=0
#        nvram commit
#    fi
#    if [ "`cat /proc/gxp/dev_info/hw_features/dect`" = "1" ]; then
#        HAS_DECT=1
#        FACT_EEPROM=`cat /proc/mtd  | grep "EEPROM_FACT" | cut -d ':' -f 1`
#        FACT_EEPROM_SIZE=$((0x`cat /proc/mtd | grep "EEPROM_FACT" | cut -d' ' -f2`))
#        if [ -n "$FACT_EEPROM" ]; then
#            if [ -z "`flash_iserased -p /dev/$FACT_EEPROM -s $FACT_EEPROM_SIZE`" ]; then
#                NEEDS_FACT_EEPROM=1
#            fi
#        else
#            echo "ERROR: no fact eeprom found in /proc/mtd"
#        fi
#        /app/bin/eeprom-update /dev/mtd9 /dev/mtd10 /dev/mtd11 /eeprom.dat &
#        sleep 1
#    else
#        /app/bin/eeprom-update /eeprom.dat &
#    fi
#else
#    echo "NEED TO ADD /app/bin/eeprom-update /eeprom.dat  equivalent for dfv9"
#    /app/bin/eeprom-update /eeprom.dat &
#fi

# if we have an nfs mount point then send the console.log directly there
if [ "`nvram get nfs_core_mounted`" = "1" ]; then
    # if we have nfs support then dump the console output to a file 
    local CONSOLE_DUMP="/core/${MAC}/console_$MAC_${TIME}_$VER.log"
    echo "NFS mount available. Start console dump at $CONSOLE_DUMP"
    sendlog file /proc/kmsg $CONSOLE_DUMP &
fi

