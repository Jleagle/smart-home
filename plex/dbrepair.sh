#!/usr/bin/env bash

set -euo pipefail

PLEX_CONTAINER="plex"
REPO="ChuckPa/DBRepair"

if [ "$(docker inspect -f '{{.State.Running}}' "$PLEX_CONTAINER" 2>/dev/null)" != "true" ]; then
  echo "Error: Plex container '$PLEX_CONTAINER' is not running!" >&2
  exit 1
fi

# Release assets are named by the container's CPU architecture
case "$(docker exec "$PLEX_CONTAINER" uname -m)" in
  x86_64)  ARCH="x86_64" ;;
  aarch64) ARCH="arm64" ;;
  armv7l)  ARCH="arm32" ;;
  *) echo "Error: unsupported container architecture" >&2; exit 1 ;;
esac

# Latest release tag (e.g. v26.10.00), taken from the releases/latest redirect
TAG="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/${REPO}/releases/latest")"
TAG="${TAG##*/}"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

echo "Downloading DBRepair ${TAG} (${ARCH})..."
curl -fsSL --retry 3 -o "${WORKDIR}/DBRepair.zip" \
  "https://github.com/${REPO}/releases/download/${TAG}/DBRepair-${TAG#v}-Linux-${ARCH}.zip"
unzip -q "${WORKDIR}/DBRepair.zip" DBRepair -d "$WORKDIR"
chmod +x "${WORKDIR}/DBRepair"
docker cp "${WORKDIR}/DBRepair" "${PLEX_CONTAINER}:/DBRepair"

# Allocate a TTY only when attached to one, so the script also runs from cron
DOCKER_OPTS=(-i)
if [ -t 0 ] && [ -t 1 ]; then
  DOCKER_OPTS+=(-t)
fi

echo "Running DBRepair (automatic: stop -> check/repair -> start)..."
docker exec "${DOCKER_OPTS[@]}" "$PLEX_CONTAINER" /DBRepair automatic exit

echo "DBRepair execution complete."
