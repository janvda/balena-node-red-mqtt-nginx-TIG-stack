# Balena-arm-TIG-monitoring

This composite docker application monitors the system resources of the device where it is deployed on.  This application can be deployed through [BalenaCloud](https://www.balena.io/) on any arm device (e.g. a raspberry pi) running the [balena OS](https://www.balena.io/os/).

It consists of the following three docker containers (= TIG stack)

1. Telegraf
2. Influxdb
3. Grafana

The Grafana user interface can be accessed through the `public device URL` that you can find in your balanaCloud dashboard.  This means that you can access your Grafana dashboards wherever you have internet access !
