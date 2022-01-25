#!/usr/bin/env bash

docker exec influx influx setup \
      --username $INFLUX_USERNAME \
      --password $INFLUX_PASSWORD
