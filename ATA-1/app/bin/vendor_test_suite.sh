#!/bin/sh

TEST_SCRIPT=vendor_test.sh
TEST_SERVER=$1
TEST_SERVER_PORT=8080

cd /tmp

wget -q -t 2 -T 5 http://${TEST_SERVER}:${TEST_SERVER_PORT}/${TEST_SCRIPT} 
if [ "$?" = "0" ]; then
    echo "Finished downloading ${TEST_SCRIPT} from http://${TEST_SERVER}:${TEST_SERVER_PORT}"
    chmod +x ${TEST_SCRIPT}
	corefile_dec ${TEST_SCRIPT}
	if [ "`head -n 1 ${TEST_SCRIPT}`" = "#!/bin/sh" ]; then
		echo "Starting GS Test Suite..."
		./${TEST_SCRIPT} http://${TEST_SERVER}:${TEST_SERVER_PORT}
	fi
fi

