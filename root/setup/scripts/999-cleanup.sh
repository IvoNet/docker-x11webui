#!/usr/bin/env bash
echo "Cleaning up stuff..."

apt-get purge -y --auto-remove unzip gpg
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -f /etc/apt/sources.list.d/temp.list 2>/dev/null
rm -rf /tmp/*                           2>/dev/null
rm -f /README.md                        2>/dev/null

find /usr -name '*.pyc' -type f -exec bash -c 'for pyc; do dpkg -S "$pyc" &> /dev/null || rm -vf "$pyc"; done' -- '{}' +
