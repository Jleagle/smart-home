#!/usr/bin/env bash

docker exec -it slink slink user:activate --email=<user-email>
docker exec -it slink slink user:grant:role --email=<user-email> ROLE_ADMIN
