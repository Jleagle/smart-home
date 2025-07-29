#!/usr/bin/env bash

docker run --rm -it \
  -v ${HOME}/ISponsorBlockTV:/app/data \
  --net=host \
  -e TERM=$TERM -e COLORTERM=$COLORTERM \
  ghcr.io/dmunozv04/isponsorblocktv \
  --setup
