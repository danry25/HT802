#!/bin/sh

CUR_DIR=`pwd`
TEST_DIR=gs_test
TEST_SCRIPT=gs_test_script.sh
TEST_SERVER=`nvram get gs_test_server`
TEST_SERVER_PORT=80

if [ ! -d /${TEST_DIR} ]; then
        mkdir /${TEST_DIR}
fi

cd /${TEST_DIR}

wget -q -t 2 -T 5 http://${TEST_SERVER}:${TEST_SERVER_PORT}/${TEST_SCRIPT} 
if [ "$?" = "0" ]; then
    echo "Finished downloading ${TEST_SCRIPT} from http://${TEST_SERVER}:${TEST_SERVER_PORT}"
    chmod +x ${TEST_SCRIPT}
    echo "Starting GS Test Suite..."
    ./${TEST_SCRIPT} http
else
    echo "ERROR downloading ${TEST_SCRIPT} from http://${TEST_SERVER}:${TEST_SERVER_PORT}"
    echo "Falling back to TFTP server..."
    tftp -g -r ${TEST_SCRIPT} ${TEST_SERVER}
    if [ "$?" = "0" ]; then
        echo "Finished downloading ${TEST_SCRIPT} from TFTP ${TEST_SERVER}"
        chmod +x ${TEST_SCRIPT}
        echo "Starting GS Test Suite..."
        ./${TEST_SCRIPT} tftp
    else
        echo "Failed to download ${TEST_SCRIPT} via HTTP or TFTP check test server ip address"
    fi
fi

cd ${CUR_DIR}


