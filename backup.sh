#!/usr/bin/env bash

# Note: Remove --dry-run to actually perform the backup
# dc down first

rsync \
	--archive \
	--compress \
	--progress \
	--partial \
	--human-readable \
	--rsync-path="sudo rsync" \
	--rsh 'ssh -oPort=2222' \
	--exclude="Tautulli/cache/" \
	--exclude="Repo/" \
	--exclude=".cache/JetBrains/" \
	--exclude="Hass/Config/.cache/" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/Cache" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/CrashReports" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/Drivers" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/Logs" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/Media/" \
	--exclude="Plex/Config/Library/Application Support/Plex Media Server/Metadata" \
	seven-remote:/home/james ~/Downloads/Seven/
