#!/usr/bin/env bash

./pull.sh

docker-compose pull
docker-compose up --detach --remove-orphans
docker system prune -a -f
