#!/bin/sh

INPUT=/rom/etc/gxe50xx.pem
#INPUT=gxe50xx.pem

#read the first 887 chars from the pem file. This will contain the private key 
head -c 887 "$INPUT" > /etc/default.key

#Restore default to flash
cat /etc/default.key > /proc/gxp/dev_info/security/private_key

#read the last 1472 chars from the pem file. This will contain the certificate
tail -c 1472 "$INPUT" > /etc/default.crt

#Restore default to flash
cat /etc/default.crt > /proc/gxp/dev_info/security/certificate
