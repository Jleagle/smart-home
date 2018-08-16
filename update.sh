#!/usr/bin/env bash

git fetch origin
git reset --hard origin/master

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker-compose pull
docker-compose up -d
docker-compose logs -f
