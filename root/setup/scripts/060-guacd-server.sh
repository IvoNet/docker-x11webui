#!/usr/bin/env bash

$agi build-essential \
     libcairo2-dev \
     libjpeg-turbo8-dev \
     libpng-dev \
     libtool-bin \
     libossp-uuid-dev \
     libvncserver-dev \
     freerdp2-dev \
     libssh2-1-dev \
     libtelnet-dev \
     libwebsockets-dev \
     libpulse-dev \
     libvorbis-dev \
     libwebp-dev \
     libssl-dev \
     libpango1.0-dev \
     libswscale-dev \
     libavcodec-dev \
     libavutil-dev \
     libavformat-dev

cd /opt

wget https://downloads.apache.org/guacamole/1.4.0/source/guacamole-server-1.4.0.tar.gz
tar -xvf guacamole-server-1.4.0.tar.gz
cd guacamole-server-1.4.0

CFLAGS=-Wno-error ./configure --with-init-dir=/etc/init.d --enable-allow-freerdp-snapshots

make
make install

cd /

rm -rf /opt/guacamole-server-1.4.0
rm -f /opt/guacamole-server-1.4.0.tar.gz

cd /setup/scripts