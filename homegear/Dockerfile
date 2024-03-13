ARG BUILD_FROM
ARG BUILD_ARCH

FROM homegear/homegear:stable

LABEL org.opencontainers.image.authors="stefan@armbruster-it.de"

# up
COPY script/entrypoint.sh /entrypoint.sh
# RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]

EXPOSE 2001 2002 2003
