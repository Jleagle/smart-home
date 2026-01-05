#!/usr/bin/env bash

mkdir -p ~/AdGuard/Conf
mkdir -p ~/AdGuard/Work
mkdir -p ~/Bazarr
mkdir -p ~/Beszel
mkdir -p ~/ChangeDetection
mkdir -p ~/DDNS
mkdir -p ~/Deepstack
mkdir -p ~/DoubleTake
mkdir -p ~/Frigate
mkdir -p ~/Hass
mkdir -p ~/Huntarr
mkdir -p ~/ISponsorBlockTV
mkdir -p ~/Jellyfin
mkdir -p ~/Media/Frigate
mkdir -p ~/Media/Movies
mkdir -p ~/Media/Slskd
mkdir -p ~/Media/Television
mkdir -p ~/Media/YouTube
mkdir -p ~/N8n/Data
mkdir -p ~/N8n/Files
mkdir -p ~/NodeRed
mkdir -p ~/NZBGet/Config
mkdir -p ~/NZBGet/Downloads
mkdir -p ~/Plex/Config
mkdir -p ~/Plex/Transcoding
mkdir -p ~/Prowlarr
mkdir -p ~/Radarr
mkdir -p ~/RealDebrid/DB
mkdir -p ~/RealDebrid/Downloads/radarr
mkdir -p ~/RealDebrid/Downloads/sonarr
mkdir -p ~/Redis/Data
mkdir -p ~/Slink/Database
mkdir -p ~/Slink/Images
mkdir -p ~/Slskd
mkdir -p ~/Sonarr
mkdir -p ~/Strava
mkdir -p ~/Traefik
mkdir -p ~/UptimeKuma
#mkdir -p ~/AssistantRelay/Responses
#mkdir -p ~/Authentik/Certs
#mkdir -p ~/Authentik/Media
#mkdir -p ~/Authentik/Templates
#mkdir -p ~/CodeProjectAI
#mkdir -p ~/Elastic
#mkdir -p ~/FlexTV
#mkdir -p ~/Go2rtc/Config
#mkdir -p ~/Grafana/Data
#mkdir -p ~/Homepage
#mkdir -p ~/Influx
#mkdir -p ~/Kibana
#mkdir -p ~/Mass
#mkdir -p ~/Matrix
#mkdir -p ~/Mealie
#mkdir -p ~/Minecraft
#mkdir -p ~/Mosquitto/Data
#mkdir -p ~/Mosquitto/Log
#mkdir -p ~/PiHole
#mkdir -p ~/PlexMeta
#mkdir -p ~/Postgres/Data
#mkdir -p ~/SerpBear
#mkdir -p ~/Syncthing/Config
#mkdir -p ~/Syncthing/Data
#mkdir -p ~/Tautulli
#mkdir -p ~/Technitium
#mkdir -p ~/Varken
#mkdir -p ~/Zinc

touch ~/Auth/config.json
touch ~/Frigate/config.yml
touch ~/Hass/assistant_service_account.json
touch ~/Traefik/acme.json
#touch ~/AssistantRelay/config.json
#touch ~/DDNS/records.yaml
#touch ~/Mosquitto/Log/mosquitto.log

chmod 600 ~/Traefik/acme.json
