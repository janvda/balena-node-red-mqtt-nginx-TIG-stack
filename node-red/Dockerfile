FROM nodered/node-red-docker:rpi-v8
# following instructions allow node-red to listen to port 80.
#USER root
#RUN sudo setcap 'cap_net_bind_service=+ep'  $(eval readlink -f `which node`)
#USER node-red
#COPY settings.js /data
RUN npm install node-red-contrib-resinio
RUN npm install node-red-dashboard
RUN npm install node-red-contrib-credentials
