DBUS_SESSION_BUS_ADDRESS=$(/usr/bin/dbus-daemon --fork --config-file=/etc/dbus-1/session.conf --print-address)
export DBUS_SESSION_BUS_ADDRESS
