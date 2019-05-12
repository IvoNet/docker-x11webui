#!/usr/bin/with-contenv bash
##############################################################################
# Environment setup
##############################################################################
# This section contains some needed environment configuration.
##############################################################################

export LC_ALL="C.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export TERM="xterm"
export HOME="/root"
export GUACD_LOG_LEVEL=error

# Make sure that DISPLAY is always configured
if [ -z $DISPLAY ]; then
    export DISPLAY=:1
fi

export HOME=/nobody

# Fix:
# for pulseaudio
/usr/bin/dbus-uuidgen > /var/lib/dbus/machine-id

# Fix:
# VNC gave some warnings and this removed them...
mkdir -p /etc/X11/xserver
touch /etc/X11/xserver/SecurityPolicy

