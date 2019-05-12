#!/usr/bin/with-contenv bash
export LC_ALL="C.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export TERM="xterm"
export HOME="/root"
export GUACD_LOG_LEVEL=error

if [ -z $DISPLAY ]; then
    export DISPLAY=:1
fi

export HOME=/nobody

chmod +x /startapp.sh 2>/dev/null

# Fix:
# for pulseaudio
/usr/bin/dbus-uuidgen > /var/lib/dbus/machine-id

# Fix:
# for VNC?!
mkdir -p /etc/X11/xserver
touch /etc/X11/xserver/SecurityPolicy

