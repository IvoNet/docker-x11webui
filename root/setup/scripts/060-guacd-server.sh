#!/usr/bin/env bash

# Optional dependencies
$agi libavcodec-dev \
     libavutil-dev \
     libswscale-dev \
     libpango1.0-dev \
     libssh2-1-dev \
     libvncserver-dev \
     libpulse-dev \
     libssl-dev \
     libvorbis-dev \
     libwebp-dev

$agi libguac-client-vnc0

#Guacamole Server
$agi guacd

