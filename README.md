# Secure-Browser
#Build
docker build -t firefox .
#RUN
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox
