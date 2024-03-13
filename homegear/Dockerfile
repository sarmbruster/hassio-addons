ARG BUILD_FROM
ARG BUILD_ARCH

# homegear is only available until focal 
FROM phusion/baseimage:focal-1.2.0

LABEL org.opencontainers.image.authors="stefan@armbruster-it.de"

#RUN \
    # Download and install Homegear's package validation key \
RUN curl -fsSL https://apt.homegear.eu/Release.key | gpg --dearmor -o /usr/share/keyrings/homegear-archive-keyring.gpg 
    # Add Homegear's repository to APT \
RUN echo 'deb [signed-by=/usr/share/keyrings/homegear-archive-keyring.gpg] https://apt.homegear.eu/ubuntu/focal/homegear/stable/ focal main' > /etc/apt/sources.list.d/homegear.list
RUN apt update && apt upgrade -y 
    # Install Homegear \
RUN apt install -y homegear homegear-homematicbidcos

# consider other modules as needed:
#    apt install homegear homegear-management homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-nanoleaf homegear-ccu homegear-mbus homegear-influxdb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# up
COPY script/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]

EXPOSE 2001 2002 2003
