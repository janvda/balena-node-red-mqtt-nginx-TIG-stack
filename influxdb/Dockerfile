FROM arm32v7/influxdb:latest

# If the following instruction refers to an existing USB drive (e.g. memory stick) connected to the device
# then it will use that drive for storing in the influxdb otherwise it will use the named volume
# that is specified in the docker compose yaml file.
#
# So the instruction below refers to a connected USB drive with label "influxdb" which should be in "ext4" format.
RUN echo "LABEL=influxdb /mnt/influxdb ext4 rw,relatime,discard,data=ordered 0 2"  >> /etc/fstab

# The script "my_entrypoint.sh" is an extension of the existing script with extra instructions to mount the usb memory stick.
COPY my_entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY influxdb.conf /etc/influxdb