#!/usr/bin/env bash

/usr/bin/nice -n 10 /usr/bin/rsync \
--human-readable \
--archive \
--delete \
--delete-excluded \
--stats \
--progress \
--verbose \
/mnt/96848BE4848BC4E9/ /mnt/34D26DEED26DB4B0/
