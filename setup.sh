#!/usr/bin/env bash

mkdir -p ~/AdGuard/Conf
mkdir -p ~/AdGuard/Work
mkdir -p ~/AssistantRelay/Responses
mkdir -p ~/Bazarr
mkdir -p ~/ChangeDetection
mkdir -p ~/DDNS
mkdir -p ~/DoubleTake
mkdir -p ~/FlexTV
mkdir -p ~/Frigate
mkdir -p ~/Grafana/Data
mkdir -p ~/Hass
mkdir -p ~/Homepage
mkdir -p ~/Influx
mkdir -p ~/Matrix
mkdir -p ~/Mealie
mkdir -p ~/Media/Frigate
mkdir -p ~/Media/Movies
mkdir -p ~/Media/Television
mkdir -p ~/Media/YouTube
mkdir -p ~/Minecraft
mkdir -p ~/Mosquitto/Data
mkdir -p ~/Mosquitto/Log
mkdir -p ~/NodeRed
mkdir -p ~/NZBGet/Config
mkdir -p ~/NZBGet/Downloads
mkdir -p ~/PiHole
mkdir -p ~/Plex/Config
mkdir -p ~/Plex/Transcoding
mkdir -p ~/PlexMeta
mkdir -p ~/Prowlarr
mkdir -p ~/Radarr
mkdir -p ~/SerpBear
mkdir -p ~/Sonarr
mkdir -p ~/Syncthing/Config
mkdir -p ~/Syncthing/Data
mkdir -p ~/Tautulli
mkdir -p ~/Traefik
mkdir -p ~/UptimeKuma
mkdir -p ~/Varken
mkdir -p ~/Zinc

touch ~/Auth/config.json
touch ~/AssistantRelay/config.json
touch ~/DDNS/records.yaml
touch ~/Frigate/config.yml
touch ~/Hass/assistant_service_account.json
touch ~/Mosquitto/Log/mosquitto.log
touch ~/Traefik/acme.json

chmod 600 ~/Traefik/acme.json
