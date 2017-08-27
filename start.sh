#!/bin/sh

# set -e #Exit immediately if a command exits with a non-zero status.
echo "kuch bhi"
#Check if image already running
if [[ -n "$(sudo docker ps -qaf 'name=firefox')" ]]; then
	sudo docker restart firefox
else
	sudo docker build -t firefox /home/grahul/Secure-Browser/
	USER_UID=$(id -u) #host user id
	USER_GID=$(id -g) #host group id
	xhost +local:docker #This permits the docker user on the local machine to connect to X windows display.

	sudo docker run -it --rm \
		--env=USER_UID=$USER_UID \
		--env=USER_GID=$USER_GID \
		--env=DISPLAY=unix$DISPLAY \
		--env=URL=$1 \
		--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
		--volume=/run/user/$USER_UID/pulse:/run/pulse:ro \
		--name firefox \
		firefox
	
	# curr_dir=$(pwd)
	# xdg-settings set default-web-browser $curr_dir/secure_firefox.desktop
 #Set default browser to containerized firefox 
fi
