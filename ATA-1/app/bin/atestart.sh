#!/bin/sh

currentpath=`pwd`
manufact_id="0"
ate_enable="0"
ate_dhcp="0"

# probe for FACT ATE embeded image
if [ -f /sbin/ate_probe ]; then
    /sbin/ate_probe
fi

/app/bin/downloadate.sh &

# Get Manufacturing facility 
if [ -f /proc/gxp/dev_info/hw_features/hw_manufact_id ]; then
    manufact_id="`cat /proc/gxp/dev_info/hw_features/hw_manufact_id`"
    echo "HT8XX manufacturer ID: ${manufact_id}"
fi
# Get ATE option 1. ATE run enable/disable  
if [ -f /proc/gxp/dev_info/hw_features/hw_manufact_opt_1 ]; then
    ate_enable="`cat /proc/gxp/dev_info/hw_features/hw_manufact_opt_1`"
    echo "HT8XX manufacturer option 1: ${ate_enable}"
fi
# Get ATE option 2. DHCP vs Static IP mode
if [ -f /proc/gxp/dev_info/hw_features/hw_manufact_opt_2 ]; then
    ate_dhcp="`cat /proc/gxp/dev_info/hw_features/hw_manufact_opt_2`"
    echo "HT8XX manufacturer option 2: ${ate_dhcp}"
fi



# for now run ht_ate only for DECT models
if [ -f /proc/gxp/dev_info/hw_features/dect -a -n "`cat /proc/gxp/dev_info/hw_features/dect`" -a ! "`cat /proc/gxp/dev_info/hw_features/dect`" = "0" ]; then
    if [ -f /app/bin/ht_ate ]; then
        echo "Enter ATE mode"
        /app/bin/ht_ate
        echo "Exit ATE mode"
    else
        echo "SKIP ATE FOR HT715 no ht_ate found"
    fi
# Run ATE for HT8XX devices 
elif [ -f /proc/gxp/dev_info/hw_features/nuv_dev -a -n "`cat /proc/gxp/dev_info/hw_features/nuv_dev`" -a ! "`cat /proc/gxp/dev_info/hw_features/nuv_dev`" = "0" ]; then
#############################################################################
#############################################################################
#############################################################################
    # force ATE to be disabled per PBI factory request. T&W will use HTTP 
    # to download ATE in real-time
    ate_enable="0"
    ate_dhcp="0"
    echo "HT8XX IGNORING FACT CFG MANNUFACTURING INFO"
#############################################################################
#############################################################################
#############################################################################

    # If the ATE is disabled via the factory cfg file then simply exit
    if [ ${ate_enable} = 0 ]; then
        echo "Force DISABLE HT8XX built-in FW ATE for manufacturer ID ${manufact_id}"
        cd $currentpath
        exit
    else
        echo "Force ENABLE HT8XX built-in FW ATE for manufacturer ID ${manufact_id}"
    fi
    
    if [ -f /app/bin/ht_ate ]; then
        nvram set :atemode=1
        echo "Enter ATE mode"
        /app/bin/ht_ate
        echo "Exit ATE mode"
        nvram set :atemode=0
        /etc/init.d/slic restart
    else
        echo "SKIP ATE FOR HT8XX no ht_ate found"
    fi
fi


cd $currentpath
