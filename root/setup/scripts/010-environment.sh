#!/usr/bin/env bash

export DEBCONF_NONINTERACTIVE_SEEN=true
export DEBIAN_FRONTEND="noninteractive"
export PYTHONDONTWRITEBYTECODE=1
export LC_ALL="C.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export TERM="xterm"
export GUACD_DIR=/usr/local/guacamole
export LD_LIBRARY_PATH=${GUACD_DIR}/lib
export DISPLAY=:1

#create a shortcut for this command as it will be used a lot...
export agi='apt-get install -y -q --no-install-recommends'

# Fix locale
locale-gen en_US
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

#fix bug
#https://github.com/inversepath/usbarmory-debian-base_image/issues/9
mkdir ~/.gnupg
echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf

apt-get update
