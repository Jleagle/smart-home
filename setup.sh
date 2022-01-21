#!/usr/bin/env bash

mkdir -p ~/Bazarr
mkdir -p ~/DDNS
mkdir -p ~/DoubleTake
mkdir -p ~/FlexTV
mkdir -p ~/Frigate
mkdir -p ~/Hass
mkdir -p ~/Hydra/Config
mkdir -p ~/Hydra/Downloads
mkdir -p ~/Media/Frigate
mkdir -p ~/Media/Movies
mkdir -p ~/Media/Television
mkdir -p ~/Media/YouTube
mkdir -p ~/NodeRed
mkdir -p ~/NZBGet/Config
mkdir -p ~/NZBGet/Downloads
mkdir -p ~/PiHole
mkdir -p ~/Plex/Config
mkdir -p ~/Plex/Transcoding
mkdir -p ~/PlexMeta
mkdir -p ~/Radarr
mkdir -p ~/Sonarr
mkdir -p ~/Tautulli
mkdir -p ~/Traefik

touch ~/Auth/config.json
touch ~/DDNS/records.yaml
touch ~/Frigate/config.yml
touch ~/Traefik/acme.json

chmod 600 ~/Traefik/acme.json
