#!/usr/bin/env bash

mkdir -p ~/Auth
mkdir -p ~/FlexTV
mkdir -p ~/Tautulli
mkdir -p ~/Traefik

touch ~/Auth/config.json
touch ~/Traefik/acme.json

chmod 600 ~/Traefik/acme.json
