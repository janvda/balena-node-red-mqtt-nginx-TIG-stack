FROM arm32v7/influxdb:latest
RUN echo "LABEL=influxdb /mnt/influxdb ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab
COPY start.sh .
