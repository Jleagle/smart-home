#!/usr/bin/env bash

set -euo pipefail

PLEX_CONTAINER="plex"
PLEX_CONFIG_HOST="${HOME}/Plex/Config"

echo "Checking if Plex container ($PLEX_CONTAINER) is running..."
if ! docker ps --format '{{.Names}}' | grep -Eq "^${PLEX_CONTAINER}$"; then
  echo "Error: Plex container '$PLEX_CONTAINER' is not running!" >&2
  exit 1
fi

echo "Downloading ChuckPa/DBRepair..."
# Ensure the host config directory exists
mkdir -p "$PLEX_CONFIG_HOST"

# Download the script to the host config folder (which is /config inside the container)
curl -sL "https://raw.githubusercontent.com/ChuckPa/DBRepair/master/DBRepair.sh" -o "${PLEX_CONFIG_HOST}/DBRepair.sh"
chmod +x "${PLEX_CONFIG_HOST}/DBRepair.sh"

echo "Successfully installed DBRepair.sh to ${PLEX_CONFIG_HOST}/DBRepair.sh"
echo "Running DBRepair with the automatic command sequence (stop -> auto -> start -> exit)..."

# Determine if we should allocate a TTY
if [ -t 0 ] && [ -t 1 ]; then
  DOCKER_OPTS="-it"
else
  DOCKER_OPTS="-i"
fi

# Execute the repair inside the container
docker exec ${DOCKER_OPTS} "$PLEX_CONTAINER" /config/DBRepair.sh stop auto start exit

echo "DBRepair execution complete."
