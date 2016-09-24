#!/bin/sh

ACS_SERVER="`nvram get 4503`"

# max allowable memory usage for gs_cpe
GS_CPE_MAX_MEM_USAGE_KB=4096

# Run gs_cpe only if ACS server is configured 
if [ ! -z ${ACS_SERVER} ]; then
    GS_CPE_MEM_MAX="`nvram get gs_cpe_max_mem`"
    # Limit the run time memory usage of the gs_cpe if configured 
    if [ ! -z ${GS_CPE_MEM_MAX} ]; then
        # different mem limit options
        if [ ${GS_CPE_MEM_MAX} = 1 ]; then
            GS_CPE_MEM_LIMIT=1024
        elif [ ${GS_CPE_MEM_MAX} = 2 ]; then
            GS_CPE_MEM_LIMIT=2048
        elif [ ${GS_CPE_MEM_MAX} = 3 ]; then
            GS_CPE_MEM_LIMIT=3072
        else
            GS_CPE_MEM_LIMIT=${GS_CPE_MAX_MEM_USAGE_KB}
        fi 

        echo "Starting TR-069 support wtih limited runtime memory of ${GS_CPE_MEM_LIMIT}kb."
        ulimit -v ${GS_CPE_MEM_LIMIT}
    else
        echo "Starting TR-069 Support..."
    fi

    #
    # Always enable core dump for gs_cpe 
    #
    ulimit -c unlimited

    /app/bin/gs_cpe &
    sleep 1
fi
