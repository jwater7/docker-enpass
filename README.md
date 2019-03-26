# docker-enpass
enpass.io password manager in a docker container

Run it like:
~~~~
docker run -it --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /path/to/persistent/storage/sync_default.walletx:/root/Documents/Enpass/walletx.db \
       jwater7/enpass
~~~~

To do it over ssh -X:
~~~~
ssh -X $HOST
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
chmod 777 /tmp/.docker.xauth
docker run -it --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.docker.xauth:/tmp/.docker.xauth -e XAUTHORITY=/tmp/.docker.xauth -v /tmp/.X11-unix:/tmp/.X11-unix -v /path/to/persistent/storage:/root/Documents/Enpass jwater7/enpass
~~~~
