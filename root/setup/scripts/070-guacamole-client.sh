#!/usr/bin/env bash
# https://www.linode.com/docs/guides/installing-apache-guacamole-on-ubuntu-and-debian/

rm -rf /var/lib/tomcat9/webapps/ROOT 2>/dev/null
curl -s -L -o /var/lib/tomcat9/webapps/ROOT.war "https://downloads.apache.org/guacamole/1.4.0/binary/guacamole-1.4.0.war"

mkdir -p /etc/guacamole/extensions/        2>/dev/null
mkdir -p /etc/guacamole/lib/               2>/dev/null
mkdir -p /etc/guacamole/disabled/          2>/dev/null

cp -v files/guacamole/* /etc/guacamole
cp -v files/guacamole-ext/* /etc/guacamole/extensions/
