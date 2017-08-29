FROM ubuntu:14.04

LABEL authors="Shubham Sharma,Rahul Gupta"

MAINTAINER "sharma.shubham736@gmail.com"

# Install PulseAudio.
WORKDIR /usr/src
RUN apt-get update \
    && apt-get install -y xdg-utils libxss1 pulseaudio libcanberra-gtk-module \
    && apt-get clean \
    && echo enable-shm=no >> /etc/pulse/client.conf

#Install firefox
RUN apt-get install -y firefox

# PulseAudio server.
ENV PULSE_SERVER /run/pulse/native

COPY dockerstart.sh /start.sh
ENTRYPOINT ["/start.sh"]

# CMD ["firefox"]