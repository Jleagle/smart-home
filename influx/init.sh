#!/usr/bin/env bash

docker exec influx influx setup \
  --username $INFLUX_USERNAME \
  --password $INFLUX_PASSWORD

# This allows you to access the v2 bucket using the v1 api, for Grafana
docker exec -it influx influx v1 dbrp create \
  --db Telegraf \
  --rp Telegraf \
  --bucket-id $BUCKET_ID \
  --token $ADMIN_TOKEN \
  --org Seven \
  --default

# This allows you to access the v2 bucket using the v1 api, for Varken
docker exec -it influx influx v1 dbrp create \
  --db Varken \
  --rp Varken \
  --bucket-id $BUCKET_ID \
  --token $ADMIN_TOKEN \
  --org Seven \
  --default

# Varken also needs a username/password
docker exec -it influx influx v1 auth create \
  --read-bucket $BUCKET_ID \
  --write-bucket $BUCKET_ID \
  --username $USERNAME \
  --org Seven \
  --token $ADMIN_TOKEN
