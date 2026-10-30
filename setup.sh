#!/usr/bin/env bash

mkdir -p ~/AdGuard/Conf
mkdir -p ~/AdGuard/Work
mkdir -p ~/Bazarr
mkdir -p ~/Beszel
mkdir -p ~/Blockbusterr
mkdir -p ~/Frigate
mkdir -p ~/Hass
mkdir -p ~/ISponsorBlockTV
mkdir -p ~/Maintainerr
mkdir -p ~/Media/Frigate
mkdir -p ~/Media/Movies
mkdir -p ~/Media/Slskd
mkdir -p ~/Media/Television
mkdir -p ~/Media/YouTube
mkdir -p ~/Mosquitto/Data
mkdir -p ~/Mosquitto/Log
mkdir -p ~/MusicAssistant
mkdir -p ~/NodeRed
mkdir -p ~/NzbDav
mkdir -p ~/NZBGet/Config
mkdir -p ~/NZBGet/Downloads
mkdir -p ~/Overseerr
mkdir -p ~/Plex/Config
mkdir -p ~/Plex/Transcoding
mkdir -p ~/Profilarr
mkdir -p ~/Prowlarr
mkdir -p ~/Pulse/Data
mkdir -p ~/Radarr
mkdir -p ~/Redis/Data
mkdir -p ~/Sonarr
mkdir -p ~/Strava
mkdir -p ~/TimeMachine
mkdir -p ~/Tinyauth
mkdir -p ~/Traefik
mkdir -p ~/UsenetStreamer
mkdir -p ~/UsenetUltimate
mkdir -p ~/UptimeKuma
mkdir -p ~/Syncthing/Config
mkdir -p ~/Syncthing/Data

touch ~/Hass/assistant_service_account.json
touch ~/Mosquitto/Log/mosquitto.log
touch ~/Pulse/config.json
touch ~/Traefik/acme.json

chmod 600 ~/Traefik/acme.json
