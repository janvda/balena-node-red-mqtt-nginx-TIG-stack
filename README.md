# Edge device (e.g. raspberry pi) monitoring by means of a composite docker application on [Balena OS](https://www.balena.io/os/).

This repository describes a composite docker application that monitors the system resources of the device where it is deployed on.  This application can be deployed through [BalenaCloud](https://www.balena.io/) on any arm device (e.g. a raspberry pi) running the [balena OS](https://www.balena.io/os/).

It consists of the following four docker containers (= TIG stack + nginx)

1. [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) - agent for collecting and reporting metrics and events
2. [Influxdb](https://www.influxdata.com/) - Time Series Database
3. [Grafana](https://grafana.com/) - create, explore and share dashboards
4. [nginx](http://nginx.org/en/docs/) - configured as reverse-proxyserver so that the http/https request becomes routed to grafana (port 30000).

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
