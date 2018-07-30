#!/usr/bin/env bash

/usr/bin/rsync \
--human-readable \
--archive \
--delete \
--delete-excluded \
--stats \
--progress \
--verbose \
--exclude 'Docker/Plex/' \
/mnt/34D26DEED26DB4B0/ /mnt/96848BE4848BC4E9/
