#!/usr/bin/env bash

# https://guacamole.apache.org/doc/gug/installing-guacamole.html
# https://guacamole.apache.org/doc/0.9.0/gug/installing-guacamole.html

curl -s -L -o /var/lib/tomcat8/webapps/ROOT.war "http://mirror.novg.net/apache/guacamole/1.0.0/binary/guacamole-1.0.0.war"

mkdir -p /etc/guacamole/extensions/        2>/dev/null
mkdir -p /etc/guacamole/lib/               2>/dev/null
mkdir -p /etc/guacamole/disabled/          2>/dev/null

cp -v files/guacamole/* /etc/guacamole
cp -v files/guacamole-ext/* /etc/guacamole/extensions/
