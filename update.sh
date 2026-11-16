#!/usr/bin/env bash

cd /home/james/Repo

. ~/.bashrc

echo "Pulling git"
git fetch origin
git reset --hard origin/main

echo "Pulling latest images..."
docker compose pull

echo "Starting services..."
docker compose up --detach --remove-orphans

echo "Restarting Traefik..."
docker compose restart traefik

echo "Cleaning up old images..."
docker system prune --force
