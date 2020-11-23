#!/bin/bash

DNS=1.1.1.1
TIMEZONE=Europe/Amsterdam
Z2MQTT_USER=zigbee2mqtt
Z2MQTT_UID=1002

set -e

adduser --ingroup dialout --system --disabled-login --uid ${Z2MQTT_UID} ${Z2MQTT_USER}

envsubst Dockerfile.template > Dockerfile
docker build . -f Dockerfile -t failfr8er/zigbee2mqtt

envsubst zigbee2mqtt.service.template > zigbee2mqtt.service
ln -s zigbee2mqtt.service /etc/systemd/system/zigbee2mqtt.service
systemctl daemon-reload
systemctl enable zigbee2mqtt

