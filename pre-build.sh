#!/usr/bin/env bash

echo "Build custom login extension..."
cd ivonet-guacamole-custom-login
mvn clean package clean
cd ..

echo "Build auto login extension..."
cd ivonet-guacamole-docker-auto-login
mvn clean package clean
cd ..
