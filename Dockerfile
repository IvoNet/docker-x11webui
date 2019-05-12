FROM ivonet/web-gui-base:latest
LABEL maintainer="Ivo Woltring - @ivonet"

ARG APP=x11webgui
ARG USERNAME=user
ARG PASSWORD=secret
ARG ADMIN_NAME=admin
ARG ADMIN_PASSWORD=admin

ENV APPNAME=$APP                                 \
    GUACAMOLE_ADMIN_USERNAME=$ADMIN_NAME         \
    GUACAMOLE_ADMIN_PASSWORD=$ADMIN_PASSWORD     \
    GUACAMOLE_USER_NAME=$USERNAME                \
    GUACAMOLE_USER_PASSWORD=$PASSWORD

COPY root/ /
