FROM arm32v7/telegraf:latest
COPY telegraf.conf /etc/telegraf
RUN apt-get update && apt-get install -y hddtemp lm-sensors
