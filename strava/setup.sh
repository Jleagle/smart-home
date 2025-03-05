#!/usr/bin/env bash

docker compose exec strava bin/console app:strava:build-files
docker compose exec strava bin/console app:strava:import-data
