#!/bin/sh

cd /

MODEL=`cat /proc/gxp/dev_info/dev_alias`
MAC=`nvram get 67`
WAN_DEVICE=`nvram get wan_device`

RX_LAST=0
TX_LAST=0

BACKOFF=0
COUNT=0

prov="`nvram get :ini_prov`"
while [ "$prov" != 1 ]; do
	sleep 5
	prov="`nvram get :ini_prov`"
done    

while [ "1" == "1" ]; do
    sleep 20
    LOAD=$(uptime | sed 's/^.*load average://' | sed s/,//g | awk '{print $1" "$2" "$3}')
    COUNT=$(($COUNT+1))
    if [ "`echo $LOAD | awk '{split($1,arr,".");print arr[1]}'`" -gt 0 ]; then
        if [ "$COUNT" = "5" ]; then
            COUNT=0
            BACKOFF=0
        elif [ "$BACKOFF" = "1" ]; then
            continue
        else
            COUNT=0
            BACKOFF=1
        fi
    elif [ "$BACKOFF" = "1" ]; then
        BACKOFF=0
    elif [ "$COUNT" = "5" ]; then
        COUNT=0
    else
        continue
    fi
    NET=$(ifconfig eth0 | grep "RX bytes" | sed s/:/\ /g | awk '{print $3" "$8}')
    RX="`echo $NET | awk '{print $1'}`"
    TX="`echo $NET | awk '{print $2'}`"
    RX_NET=$(($RX-$RX_LAST))
    TX_NET=$(($TX-$TX_LAST))
    RX_LAST=$RX
    TX_LAST=$TX
    top -b -n 1 > top.txt
    GS_ATA_PS=$(cat top.txt | grep "gs_ata" -m 1 | awk '{print $1}')
	GS_ATA_VM="`cat /proc/${GS_ATA_PS}/status|grep ^Vm|tr -s "\n" " "|tr -s "\t" " "`"
    GS_ATA_MEM=$(cat top.txt | grep "gs_ata" -m 1 | awk '{print $5}')
    GS_ATA_CPU=$(cat top.txt | grep "gs_ata" | awk '{sub(/%+/,"",$7);print $7}')
    GS_ATA_CPU=$(echo $GS_ATA_CPU | sed s/\n//)
    if [ "`echo $LOAD | awk '{split($1,arr,".");print arr[1]}'`" -gt 1 ]; then
        HIGH_CPU=`cat top.txt | grep -v "top" | awk '{sub(/N/,"",$0)}{if( match( $1, /[0-9]+/ ) ) { sub( /\%/,"",$7 ); X=$7+0; if ( X > 20 ) { print $8" "$7 } } }'`
        HIGH_CPU=$(echo $HIGH_CPU | sed -e 's/\n/ /')
    else
        HIGH_CPU=""
    fi
    logger -t "${MODEL}_STAT" "[$MAC]:[ $LOAD | $TX_NET $RX_NET | $GS_ATA_MEM | $GS_ATA_CPU ]"
    logger -t "${MODEL}_STAT" "[$MAC]:[ $GS_ATA_VM ]"
    if [ -n "$HIGH_CPU" ]; then
        logger -t ${MODEL}_STAT "[$MAC]:**[ $HIGH_CPU ]**"
    fi
done

