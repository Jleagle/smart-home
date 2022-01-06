rsync --human-readable --recursive --verbose --relative --links --times --delete --force -e ssh ${MEDIA_DATA}/ james@192.168.0.7:/home/james/Incoming/Content
rsync --human-readable --recursive --verbose --relative --links --times --delete --force -e ssh ${DOCKER_DATA}/ james@192.168.0.7:/home/james/Incoming/Docker

#  --stats \
#  --progress \
#  --compress \
