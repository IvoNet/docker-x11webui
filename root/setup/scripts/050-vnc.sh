#!/usr/bin/env bash

$agi tigervnc-standalone-server

#mkdir -p /nobody/.vnc 2>/dev/null
#echo "${PASSWORD:-secret}" | vncpasswd -f > /nobody/.vnc/passwd
#chmod 600 /nobody/.vnc/passwd