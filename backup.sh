#!/usr/bin/env bash

# https://restic.readthedocs.io/en/latest/index.html

#docker run --rm -v ${HOME}:/data \
#  -e RESTIC_REPOSITORY=s3:s3.amazonaws.com/bucket_name \
#  -e RESTIC_PASSWORD=my-secure-password \
#  -e AWS_ACCESS_KEY_ID=my-aws-access-key \
#  -e AWS_SECRET_ACCESS_KEY=my-aws-secret-key \
#  instrumentisto/restic backup /data

# dc down
rsync \
	--dry-run \
	--archive \
	--compress \
	--progress \
	--partial \
	--human-readable \
	--rsh 'ssh -oPort=2222' \
	--exclude="Media" \
	--exclude="nas-backup/" \
	--exclude="nas-backup2/" \
	--exclude="Tautulli/cache/" \
	--exclude="Repo/" \
	--exclude="Plex/Config/Library/Application\ Support/Plex\ Media\ Server/Media/" \
	--exclude="Plex/Config/Library/Application\ Support/Plex\ Media\ Server/Cache/" \
	seven:/home/james ~/Downloads/Seven/
# ./update.sh
