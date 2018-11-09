# Edge Device (e.g. raspberry pi) Monitoring by means of composite docker application on [Balena OS](https://www.balena.io/os/).

This composite docker application monitors the system resources of the device where it is deployed on.  This application can be deployed through [BalenaCloud](https://www.balena.io/) on any arm device (e.g. a raspberry pi) running the [balena OS](https://www.balena.io/os/).

It consists of the following three docker containers (= TIG stack)

1. Telegraf
2. Influxdb
3. Grafana

The Grafana user interface can be accessed (login and password is `admin`) at port 80 of the host OS.  This also means that you can access it through the `public device URL` that you can find in your [BalenaCloud](https://www.balena.io/) dashboard.  In other words you can access your Grafana dashboards wherever you have internet access !

Here below a screenshot of the dashboard that is also provisioned by this application ( file is `grafana\dashboards\system metrics.json`)

![system metrics example](./system_metrics_dashboard.png)

## Provisioning Grafana Dashboards

If you want to add or update a Grafana Dashboard then this can be done through following steps:

1. Create (or Update) the dashboard in Grafana
2. From the settings menu in Grafana select `View JSON` and copy the complete json file
3. Create a file with extension `.json` in folder `grafana\dashboards` and ....
