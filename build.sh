#!/usr/bin/env bash
docker_name=ivonet
image=x11webgui
version=0.1

deploy="false"
#deploy="true"
versioning=false
#versioning=true

#OPTIONS="$OPTIONS --no-cache"
#OPTIONS="$OPTIONS --force-rm"
OPTIONS="$OPTIONS --build-arg APP=x11webgui --build-arg --build-arg USERNAME=ivonet"

cd ivonet-guacamole-docker-auto-login
mvn clean package clean
cd ..

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
