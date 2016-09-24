#!/bin/sh

SYSLOG_ENABLED=0
#sends syslog messages
syslog()
{
    if [ -n "${SYSLOG_ENABLED}" -a "${SYSLOG_ENABLED}" != "0" ]; then
        if [ "$(nvram get 208)" != "5" ]; then
            logger -p kern.info -t $(nvram get syslog_id) " PROVISION: $*"
        else
            logger -p kern.info -U -t "" "<14> $(nvram get syslog_id) PROVISION: $*"
        fi
    fi
}

if [ "x$(nvram get 207)" != "x" ]; then
    if [ "$(nvram get 208)" != "0" ]; then
        SYSLOG_ENABLED=1
    else
        SYSLOG_ENABLED=0
    fi
fi    

if [ -n "${1}" ]; then
    INFILE="${1}"
else
    INFILE="/tmp/cfg.xml"
fi    
if [ -n "${2}" ]; then
    OUTFILE="${2}"
else
    OUTFILE="/tmp/config.txt"
fi    
if [ -n "${3}" ]; then
    XMLFILE="${3}"
else
    XMLFILE="/tmp/xmlConfigOut.xml"
fi    
if [ -s "${INFILE}" ]; then
    MD5SUM="$(md5sum "${INFILE}"|cut -d' ' -f1)"
    syslog "md5sum: ${MD5SUM}"

    rm -f ${OUTFILE} ${XMLFILE}
    xml_config ${INFILE} ${OUTFILE} ${XMLFILE} #/tmp/cfg.xml /tmp/config.txt /tmp/xmlConfigOut.xml
    XMLERR=$?
    if [ $XMLERR -eq 0 -a -s "${XMLFILE}" ]; then
        MD5SUM="$(md5sum "${XMLFILE}"|cut -d' ' -f1)"
        syslog "md5sum decrypted: ${MD5SUM}"
        rm -f ${INFILE} ${XMLFILE}
    else
        if [ -s "${XMLFILE}" ]; then
            syslog "ERROR ${XMLERR}"
        elif [ $XMLERR -ne 0 ]; then    
            syslog "ERROR ${XMLERR}, file size 0"
        fi    
    fi
else    
    syslog "Config file not found!!"
fi    
