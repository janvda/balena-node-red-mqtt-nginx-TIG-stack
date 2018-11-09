# Edge device (e.g. raspberry pi) monitoring by means of a composite docker application on [Balena OS](https://www.balena.io/os/).

This repository describes a composite docker application that monitors the system resources of the device where it is deployed on.  This application can be deployed through [BalenaCloud](https://www.balena.io/) on any arm device (e.g. a raspberry pi) running the [balena OS](https://www.balena.io/os/).

It consists of the following three docker containers (= TIG stack)

1. Telegraf
2. Influxdb
3. Grafana

The Grafana user interface can be accessed (login and password is `admin`) at port 80 of the host OS.  This also means that you can access it through the `public device URL` that you can find in your [BalenaCloud](https://www.balena.io/) dashboard.  In other words you can access your Grafana dashboards wherever you have internet access !

Here below a screenshot of the `system metrics` dashboard that is also provisioned by this application ( file is `grafana\dashboards\system metrics.json`)

![system metrics example](./system_metrics_dashboard.png)

## Updating / Adding new Grafana Dashboards

If you want to add a new Grafana Dashboard then this can be done through following steps (Updating happens in a similar way):

1. Create the dashboard in Grafana
2. From the settings menu in Grafana select `View JSON` and copy the complete json file (**don't use the grafana `export` feature** as this will template the datasource and will not work due to that).
3. Create a file with extension `.json` in folder `grafana\dashboards` and paste the json contents you have copied in previous step into this file.
4. Changes replace the ID number by null.  E.g. ` "id": 1,` should be changed into ` "id": null,`
5. Commit your changes and push them to Balena Cloud.
