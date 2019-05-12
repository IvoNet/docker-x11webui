#!/usr/bin/env bash
docker_name=ivonet
image=x11webgui
version=0.1

deploy="false"
#deploy="true"
versioning=false
#versioning=true

echo "Build custom login extension..."
cd ivonet-guacamole-custom-login
mvn clean package clean
cd ..

echo "Build auto login extension..."
cd ivonet-guacamole-docker-auto-login
mvn clean package clean
cd ..

#OPTIONS="$OPTIONS --no-cache"
#OPTIONS="$OPTIONS --force-rm"
OPTIONS="$OPTIONS --build-arg VERSION=18.04"

docker build ${OPTIONS} -t $docker_name/${image}:latest .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push $docker_name/${image}:latest
fi

if [ "$versioning" == "true" ]; then
    docker tag $docker_name/${image}:latest $docker_name/${image}:${version}
    if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
        docker push $docker_name/${image}:${version}
    fi
fi
