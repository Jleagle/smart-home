rsync --human-readable --recursive --verbose --relative --links --times --delete --force -e ssh /mnt/96848BE4848BC4E9/Television james@192.168.0.7:/home/james/Incoming/Content/Television
rsync --human-readable --recursive --verbose --relative --links --times --delete --force -e ssh /mnt/96848BE4848BC4E9/Video james@192.168.0.7:/home/james/Incoming/Content/Movies
rsync --human-readable --recursive --verbose --relative --links --times --delete --force -e ssh ${DOCKER_DATA}/ james@192.168.0.7:/home/james/Incoming/Docker

#  --stats \
#  --progress \
#  --compress \
