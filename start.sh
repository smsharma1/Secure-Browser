#!/bin/sh
set -e #exitst immediately if a command exits with a non-zero status.

USER_UID=$(id -u) #host user id
USER_GID=$(id -g) #host group id
xhost +local:docker #This permits the docker user on the local machine to connect to X windows display.

url="$@"
sudo docker run --rm \
	--env=USER_UID=$USER_UID \
	--env=USER_GID=$USER_GID \
	--env=DISPLAY=unix$DISPLAY \
	--env=URL="$url" \
	--shm-size 256m \
	--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
	--volume=/run/user/$USER_UID/pulse:/run/pulse:ro \
	firefox