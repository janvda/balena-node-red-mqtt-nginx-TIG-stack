FROM nodered/node-red-docker:rpi-v8

# installing an editor
USER root
RUN apt-get update && apt-get install nano
USER node-red

RUN npm install node-red-contrib-resinio
RUN npm install node-red-dashboard
RUN npm install node-red-contrib-credentials

# install node-red-admin which is needed if you want to created hashed password for the node-red editor.
RUN sudo npm install -g --unsafe-perm node-red-admin

COPY ./settings.js /data/settings.js
