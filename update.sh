#!/usr/bin/env bash

git fetch origin
git reset --hard origin/main

docker-compose pull
docker-compose up --detach --remove-orphans
docker system prune -a -f
