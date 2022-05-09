#!/usr/bin/env bash

if [ ! -f "root/etc/guacamole/extensions/ivonet-guacamole-custom-login.jar" ]; then
  echo "Build custom login extension..."
  cd ivonet-guacamole-custom-login
  mvn clean package clean
  cd ..
fi

if [ ! -f "root/etc/guacamole/extensions/ivonet-guacamole-docker-auto-login.jar" ]; then
  echo "Build auto login extension..."
  cd ivonet-guacamole-docker-auto-login
  mvn clean package clean
  cd ..
fi