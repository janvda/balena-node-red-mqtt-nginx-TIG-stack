FROM arm32v7/influxdb:latest
RUN echo "LABEL=influxdb /mnt/usbdrive ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab
#overwrite the default entrypoint script by mine script that contains the mount instruction
COPY my_entrypoint.sh /entrypoint.sh
