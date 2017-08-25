# Secure-Browser
#Build
docker build -t firefox .
#RUN
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox
For windows:: docker run -d --name firefox1 -e DISPLAY=your-machine-ip-address:0  firefox
