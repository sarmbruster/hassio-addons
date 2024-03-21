ARG BUILD_FROM 


# homegear is only available until focal 
FROM $BUILD_FROM

RUN apt update && apt install -y curl gpg
RUN curl -fsSL https://apt.homegear.eu/Release.key | gpg --dearmor -o /usr/share/keyrings/homegear-archive-keyring.gpg 
    # Add Homegear's repository to APT \
RUN echo 'deb [signed-by=/usr/share/keyrings/homegear-archive-keyring.gpg] https://apt.homegear.eu/ubuntu/focal/homegear/stable/ focal main' > /etc/apt/sources.list.d/homegear.list
RUN apt update && apt upgrade -y 
    # Install Homegear \
RUN DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin apt install -y homegear homegear-homematicbidcos
# consider other modules as needed:
#    apt install homegear homegear-management homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-nanoleaf homegear-ccu homegear-mbus homegear-influxdb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
ARG BUILD_ARCH TEMPIO_VERSION
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

COPY rootfs /

# HA uses id 18 for dialout
RUN groupmod -g 18 dialout

EXPOSE 2001 2002 2003
