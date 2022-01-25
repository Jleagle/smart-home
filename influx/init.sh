#!/usr/bin/env bash

docker exec influx influx setup \
  --username $INFLUX_USERNAME \
  --password $INFLUX_PASSWORD

docker exec -it influx influx v1 dbrp create \
  --db Telegraf \
  --rp Telegraf \
  --bucket-id $BUCKET_ID \
  --token $ADMIN_TOKEN \
  --org Seven \
  --default
