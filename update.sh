#!/usr/bin/env bash

cd /home/james/Repo

. ~/.bashrc

echo "Pulling git"
git fetch origin
git reset --hard origin/main

get_versions() {
	local cids
	cids=$(docker compose ps -a -q 2>/dev/null)
	[ -z "$cids" ] && return

	docker inspect --format '{{with index .Config.Labels "com.docker.compose.service"}}{{.}}{{else}}{{slice .Name 1}}{{end}}|{{or (index .Config.Labels "org.opencontainers.image.version") (index .Config.Labels "org.label-schema.version") (index .Config.Labels "io.hass.version") (index .Config.Labels "version")}}|{{.Image}}' $cids 2>/dev/null | while IFS="|" read -r name ver img; do
		if [ -z "$ver" ]; then
			ver=$(docker image inspect --format '{{slice .Created 0 10}}' "$img" 2>/dev/null)
			[ -z "$ver" ] && ver="${img:7:12}"
		fi
		printf "%s\t%s\n" "$name" "$ver"
	done
}

BEFORE=$(get_versions)

echo "Pulling latest images..."
docker compose pull

echo "Building custom images..."
docker compose build --pull

echo "Starting services..."
docker compose up --detach --remove-orphans

echo "Restarting Traefik..."
docker compose restart traefik

AFTER=$(get_versions)

diff=$(join -t $'\t' -a 1 -a 2 -e "-" -o 0,1.2,2.2 <(echo "$BEFORE" | sort) <(echo "$AFTER" | sort) 2>/dev/null | while IFS=$'\t' read -r name old new; do
	[ -n "$name" ] && [ "$old" != "$new" ] && printf "%-16s %s -> %s\n" "$name" "$old" "$new"
done)

if [ -n "$diff" ]; then
	echo -e "\n${diff}\n"
else
	echo -e "\nNo container updates.\n"
fi

echo "Cleaning up old images..."
docker system prune --force | grep "Total reclaimed space" || true
