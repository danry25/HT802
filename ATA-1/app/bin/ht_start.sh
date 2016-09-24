#!/bin/sh

make_chkdir() {
	if [ ! -d $1 ]; then
		mkdir $1
	fi
}

DEV_MAC="`cat /proc/gxp/dev_info/dev_mac 2>/dev/null|tr '[A-Z]' '[a-z]' |tr -d ':'|cut -c7-12`"
if [ "${DEV_MAC}" == "000000" ]; then
	/app/bin/atestart.sh
fi

if [ ! -z "`nvram get gs_test_server`" ]; then
	/app/bin/gs_test_suite.sh
fi

#setup http/https/ftp proxy for GUI
if [ ! -z "`nvram get http_proxy`" ]; then
    export http_proxy="`nvram get http_proxy`"
    if [ "`nvram get proxy_apply_all`" = "1" ]; then
        export https_proxy=${http_proxy}
        export ftp_proxy=${http_proxy}
    else
        if [ ! -z "`nvram get https_proxy`" ]; then
            export https_proxy="`nvram get https_proxy`"
        fi
        if [ ! -z "`nvram get ftp_proxy`" ]; then
            export ftp_proxy="`nvram get ftp_proxy`"
        fi
    fi
else
    if [ ! -z "`nvram get https_proxy`" ]; then
        export https_proxy="`nvram get https_proxy`"
    fi
    if [ ! -z "`nvram get ftp_proxy`" ]; then
        export ftp_proxy="`nvram get ftp_proxy`"
    fi
fi
if [ ! -z "`nvram get no_proxy`" ]; then
    export no_proxy="`nvram get no_proxy`"
fi


#
# Start web server
#
if [ -f /usr/sbin/httpd -a -r /etc/hosts ]; then
    /app/bin/lang
    echo "Starting HTTP Server ...."
    /etc/rc.d/init.d/http start
fi

#
# Start TR069
#
if [ -f /app/bin/tr_069_start.sh ]; then
    /app/bin/tr_069_start.sh
fi

#
# Product specific
#
if [ -f /app/bin/ht_prod.sh ]; then
    echo "Starting Product Specific Support..."
    . /app/bin/ht_prod.sh
fi

#
# User defined limits for gs_ata and gs_cpe
#
if [ -n "`nvram get set_ulimit`" ]; then
    echo "Setting user defined ulimit flags..."
    echo "1" > /proc/sys/kernel/core_uses_pid
    if [ `nvram get set_ulimit` = 1 ] ; then
        echo "Setting ulimit to unlimited."
        ulimit -c unlimited
    else
        echo "Unsupported user ulimit setting."
    fi
fi

# enable core dumps for all devices
ulimit -c unlimited
ulimit -s 1024

# increase AF_UNIX socket message number limitation
echo 50 > /proc/sys/net/unix/max_dgram_qlen

#
# Start gs_ata
#
if [ ! -z "`nvram get gdb_debug_server`" ]; then
    GDB_SERVER_IP=`nvram get gdb_debug_server`
    GDB_SERVER_PORT=9876
    tftp -g -r gdbserver ${GDB_SERVER_IP}
    if [ -f ./gdbserver ]; then
        chmod +x gdbserver
        echo "Starting gs_ata with GDB support @ ${GDB_SERVER_IP}:${GDB_SERVER_PORT}"
        ./gdbserver ${GDB_SERVER_IP}:${GDB_SERVER_PORT} /app/bin/gs_ata &
    fi
else
    echo "Starting gs_ata..."
    /app/bin/gs_ata &
    echo $! > /var/run/gs_ata.pid
fi

#send out statistics
#if [ -f /bin/stats.sh ]; then
#	busybox nice -n 5 /bin/stats.sh >/dev/null 2>&1 &
#fi
