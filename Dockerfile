ARG VERSION=22.04
FROM ivonet/ubuntu-s6:${VERSION}

LABEL maintainer="Ivo Woltring - @ivonet"

ENV DISPLAY=:1

COPY root/ /
RUN chmod +x /setup/install.sh \
 && /setup/install.sh \
 && rm -rf /setup

# Guacamole web view port
EXPOSE 32000
# VNC server port
EXPOSE 5901
