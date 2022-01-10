rsync --human-readable --recursive --stats --verbose --links --times -e ssh /mnt/96848BE4848BC4E9/Television james@192.168.0.7:/home/james/Incoming/Content/Television
rsync --human-readable --recursive --stats --verbose --links --times -e ssh /mnt/96848BE4848BC4E9/Video/ james@192.168.0.7:/home/james/Media/Movies/
rsync --human-readable --recursive --stats --verbose --links --times -e ssh /home/james/docker-data james@192.168.0.7:/home/james/Incoming/Docker

#  --stats \
#  --progress \
#  --compress \
