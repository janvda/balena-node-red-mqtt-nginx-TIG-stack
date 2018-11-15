#!/bin/bash
# JVA 2018-11-15 I have added following instructions to mount usbdrive and create subfolder influxdb
# this is added to that we can also monitor the usbdrive.
mkdir -p /mnt/usbdrive
mount /mnt/usbdrive

# here below copy paste of original entrypoint.sh. see : 
# https://github.com/influxdata/influxdata-docker/blob/e90ed7bbdcd69305c615fe9be7903ef2e93ad978/telegraf/1.8/entrypoint.sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"