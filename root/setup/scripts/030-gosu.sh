#!/usr/bin/env bash

#https://github.com/tianon/gosu/releases
#grab gosu for easy step-down from root
GOSU_VERSION=1.12
dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')";
curl -s -L -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-${dpkgArch}"
curl -s -L -o /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-${dpkgArch}.asc"
export GNUPGHOME="$(mktemp -d)"
gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu
command -v gpgconf && gpgconf --kill all || :;
rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu
gosu --version;

