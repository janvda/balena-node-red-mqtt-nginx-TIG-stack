#!/bin/bash
# JVA 2018-11-15 I have added following instructions to mount usbdrive and create subfolder influxdb
mkdir -p /mnt/influxdb
mount /mnt/influxdb

# here below copy paste of original entrypoint.sh. see : 
#  https://github.com/influxdata/influxdata-docker/tree/35d89882b57f333d9518b4556e7b872ce970e620/influxdb/1.7
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- influxd "$@"
fi

if [ "$1" = 'influxd' ]; then
	/init-influxdb.sh "${@:2}"
fi

exec "$@"