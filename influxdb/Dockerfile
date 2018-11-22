FROM arm32v7/influxdb:latest

RUN echo "LABEL=influxdb2 /mnt/usbdrive ext4 rw,relatime,discard,data=ordered 0 2"  >> /etc/fstab

# The script "my_entrypoint.sh" is an extension of the existing script with extra instructions to mount the usb memory stick.
COPY my_entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY influxdb.conf /etc/influxdb