#!/bin/sh
echo Building ts-builder-image  

docker build --no-cache -t ts-builder-image . -f Dockerfile.build
docker container create --name ts-builder-image-container ts-builder-image  
docker container cp ts-builder-image-container:/home/node/app/build ./  
docker container rm -f ts-builder-image-container

echo Serving ts-builder-image 

docker build --no-cache -t ts-server-image . -f Dockerfile.prod

rm -r build

# This is for local running and demonstration
docker-compose -f docker-compose.prod.yml up --build