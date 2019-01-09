#!/usr/bin/env bash

bash ./pull.sh

docker-compose pull
docker-compose up -d --remove-orphans

watch -n 2 docker-compose ps
