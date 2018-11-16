FROM arm32v7/telegraf:latest
COPY telegraf.conf /etc/telegraf/telegraf.conf

# add the mounting parameters for my USB memory stick to /etc/fstab
# RUN echo "LABEL=influxdb /mnt/usbdrive ext4 ro,relatime,discard,data=ordered 0 2" >> /etc/fstab

# The script "my_entrypoint.sh" is an extension of the existing script with extra instructions to mount the usb memory stick.
#COPY my_entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

