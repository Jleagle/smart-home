#!/usr/bin/env bash

bash ./pull.sh

. ~/.bashrc

docker compose pull
docker compose up --detach --remove-orphans
docker compose restart traefik

docker system prune --all --force
