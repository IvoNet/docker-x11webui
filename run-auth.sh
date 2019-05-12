#!/usr/bin/env bash
NAME=x11webgui
PORT=8080
killpulse() {
    pulseaudio --kill 2>/dev/null
    killall pulseaudio 2>/dev/null
    rm -rf ~/.config/pulse 2>/dev/null
    mkdir -p ~/.config/pulse 2>/dev/null
}

[[ -z "$(brew ls --versions pulseaudio)" ]] && brew install pulseaudio
killpulse
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null

authenticate=${1:-true}

docker run                                   \
    -it                                      \
    --rm                                     \
    --name $NAME                             \
    -e AUTH=${authenticate}                  \
    -e USERNAME=ivonet                       \
    -e PASSWORD=geheim                       \
    -e PULSE_SERVER=docker.for.mac.localhost \
    -v ~/.config/pulse:/nobody/.config/pulse \
    -p ${PORT}:32000                         \
    ivonet/x11webgui

killpulse
