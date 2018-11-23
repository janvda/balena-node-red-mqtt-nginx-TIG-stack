FROM arm32v7/influxdb:latest

# The following instruction defines the mount location where the influxdb data should be stored.
# In this case it is referring to an USB memory stick with label "influxdb" that is formatted in "ext4" format.
# If there is no such USB drive connected to the device then the named volume specified in the
# docker compose will be used.
#
RUN echo "LABEL=influxdb2 /mnt/influxdb ext4 rw,relatime,discard,data=ordered 0 2"  >> /etc/fstab

# The script "my_entrypoint.sh" is an extension of the existing script with extra instructions to mount the usb memory stick.
COPY my_entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY influxdb.conf /etc/influxdb