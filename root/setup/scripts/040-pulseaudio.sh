#!/usr/bin/env bash

$agi pulseaudio \
     alsa-base \
     dbus \
     dbus-x11

mkdir -p /nobody/.config/pulse 2>/dev/null
dbus-uuidgen > /var/lib/dbus/machine-id
echo "load-module module-native-protocol-tcp auth-anonymous=1" >>/etc/pulse/default.pa
