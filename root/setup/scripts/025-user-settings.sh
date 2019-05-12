#!/usr/bin/env bash

usermod -u 99 nobody
usermod -g 100 nobody
usermod -m -d /nobody nobody
usermod -s /bin/bash nobody 
usermod -a -G adm,sudo,audio,video nobody
echo "nobody:PASSWD" | chpasswd
echo 'admin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers



