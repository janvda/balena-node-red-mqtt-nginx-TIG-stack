FROM nodered/node-red-docker:rpi-v8

# installing an editor
USER root
RUN apt-get update && apt-get install nano
USER node-red

RUN npm install node-red-contrib-resinio
RUN npm install node-red-dashboard
RUN npm install node-red-contrib-credentials
# RUN npm install appmetrics
RUN npm install appmetrics-dash

COPY ./settings.js /data/settings.js
#COPY ./appmetrics.properties /usr/src/node-red/node_modules/appmetrics/appmetrics.properties

# following command will add instrumentation to Node.js (= node-red)
# RUN sed -i 's?#!/usr/bin/env node?#!/usr/bin/env node;\n\n/* JVA: adding appmetrics instructions*/\nvar appmetrics = require("appmetrics");\nvar monitoring = appmetrics.monitor();\n?' /usr/src/node-red/node_modules/node-red/red.js

#RUN sed -i 's?#!/usr/bin/env node?#!/usr/bin/env node;\n\n/* JVA: adding appmetrics instructions*/\nvar dash = require("appmetrics-dash");\ndash.attach();\n?' /usr/src/node-red/node_modules/node-red/red.js
