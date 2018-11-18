# Composite docker application with _"8"_ containers (2x Node-RED, 2x MQTT broker, Telegraf, InfluxDb, Grafana, Nginx) deployed on Raspberry Pi through [Balena](https://www.balena.io).

## Features
This project is actually a proof of concept to demonstrate the following features:
1. The ability to run [many containers](#what) on a [Raspberry Pi 3 Model B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/)
2. The Built and Deployment of this multi container application using the [BalenaCloud](https://www.balena.io/)
3. Monitoring the system resources of the raspberry pi based on **TIG** stack = 
   - [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) for collecting metrics
   - [Influxdb](https://www.influxdata.com/) - Time Series Database used for storing the metrics
   - [Grafana](https://grafana.com/) - create, explore and share dashboards
4. That [Grafana](https://grafana.com/) is very nice and powerful tool to create dashboards and that it is easy to create or update those dashboards.
5. It is possible to run multiple Node-RED instances on the same device
6. It is possible to run multiple MQTT brokers on the same device.
7. A USB memory stick connected to the pi can be used for storing specific data (in this case it is the influxdb data)
8. It is possible to access the Grafana user interface and the 2 Node-RED editors over the internet by enabling the Balena public URL and properly configuring the [nginx](http://nginx.org/en/docs/) container.

## What

The `node-red` branch of this github repository describes a composite docker application consisting of **"8"** containers that can be deployed through [BalenaCloud](https://www.balena.io/) on any arm device (e.g. a raspberry pi) running the [balena OS](https://www.balena.io/os/).     

The application consists of the following 8 docker containers (= TIG stack + 2x Node-RED + 2x MQTT broker +  Nginx )

1. [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) - agent for collecting and reporting metrics and events
2. [Influxdb](https://www.influxdata.com/) - Time Series Database
3. [Grafana](https://grafana.com/) - create, explore and share dashboards
4. 2x [Node-RED](https://nodered.org/) - flow based programming for the Internet of Things (accessible through path `/nodered` )
5. 2x [MQTT-broker](https://mosquitto.org/) - lightweight message broker
4. [nginx](http://nginx.org/en/docs/) - configured as reverse-proxyserver so that the http/https request becomes routed to grafana (port 30000) and the http/https request for path `/node-red` become routed to node-red (port 1880).

![build finished successful](./build%20finished%20successful.png)

## System resource monitoring by the TIG Stack (Telegraf, Influxdb & Grafana)
The system resource monitoring is realized by the TIG stack and happens as follows:
1. The *Telegraf* container will monitor the system resources (memory, CPU, disk, network, ...) of the raspberry pi device and send them to 
2. the *Influxdb* container that will store it in an influx database.  
4. The *Grafana* container has a dashboard (see screenshot below) showing the system metrics : for this it retrieves its data from the influx database

The Grafana user interface can directly be accessed (login and password is `admin`) at port 80 of the host OS thanks to reverse-proxyserver ningx.  This also means that you can access it through the `public device URL` that you can find in your [BalenaCloud](https://www.balena.io/) dashboard.  In other words you can access your Grafana dashboards wherever you have internet access !

Here below a screenshot of the `system metrics` dashboard that is also provisioned by this application ( file is `grafana\dashboards\system metrics.json`)

![system metrics example](./system_metrics_dashboard.png)

## How to install this application on an edge device
This application can easily be installed through following steps:
1. [Balena Setup](https://www.balena.io/): you need a BalenaCloud account and your edge device must be running the BalenaOs.  You also need to create an application in your balena dashboard and associate your edge device to it (see balena documentation).
2. clone this github repository (this can be done on any device where git is installed) through the following command `git clone https://github.com/janvda/balena-edge-device-monitoring.git` (instead of directly cloning the repository it migh be better to fork the github repository and then clone this forked repository).
3. Move into this repository by command `cd balena-edge-device-monitoring`
4. Add balena git remote endpoint by running the command `git remote add balena <USERNAME>@git.www.balena.io:<USERNAME>/<APPNAME>.git`
5. push the repository to balena by the command `git push balena master` (maybe you need to add the option `--force` the first time you are deploying).

## Updating / Adding new Grafana Dashboards

If you want to add a new Grafana dashboard then this can be done through following steps (Updating an existing dashboard can be done in a similar way):

1. Create the new dashboard using the Grafana UI.
2. From the settings menu in Grafana UI select `View JSON` and copy the complete json file (**don't use the grafana UI `export` feature** as this will template the datasource and will not work due to that).
3. Save the json contents you have copied in previous step into a new file in folder `grafana\dashboards` with extension .json  (e.g. `mydashboard-02.json`)
4. Substitute the ID number you can fiInfluxDB system metrics dashboard]nd in that file just after field `"graphTooltip"` by `null`.  E.g. ` "id": 1,` should be changed into ` "id": null,`
5. Commit your changes in git and push them to your balena git remote endpoint (`git push balena master`)

## Credits
1. [Initializing Grafana with preconfigured dashboards](https://ops.tips/blog/initialize-grafana-with-preconfigured-dashboards/)  [(github repository)](https://github.com/cirocosta/sample-grafana)
2. [InfluxDB system metrics dashboard](https://grafana.com/dashboards/1138)
3. [Grafana Series Part 1: Setting up InfluxDB, Grafana and Telegraf with Docker on Linux](https://blog.linuxserver.io/2017/11/25/how-to-monitor-your-server-using-grafana-influxdb-and-telegraf/)
