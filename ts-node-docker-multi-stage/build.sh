#!/bin/sh
echo Building ts-multistage  

# This is for local running and demonstration
docker build --no-cache -t ts-multistage . -f Dockerfile

docker-compose -f docker-compose.prod.yml up --build