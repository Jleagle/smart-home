#!/usr/bin/env bash

# Pull latest changes from git
if [ -f "./pull.sh" ]; then
  bash ./pull.sh
fi

# Load bashrc if needed (optional, might not be necessary in non-interactive shell)
[ -f ~/.bashrc ] && . ~/.bashrc

echo "Pulling latest images..."
docker compose pull

echo "Starting services..."
docker compose up --detach --remove-orphans

echo "Cleaning up old images..."
docker system prune --force
