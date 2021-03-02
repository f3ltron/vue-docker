#! /bin/bash

if [ -d "/tmp/dockers" ]; then
    echo "/tmp/dockers exists delete it"
    rm -rf /tmp/dockers
fi

echo "cloning production docker file"
git clone git@github.com:f3ltron/dockers.git /tmp/dockers

echo "build image locally"
docker build --file /tmp/dockers/Dockerfile.production --tag paper:production --no-cache .

if  docker container inspect paper_prod > /dev/null; then
    echo "[PAPER] docker container paper_prod exist deleting it"
    docker container rm -f paper_prod
fi

echo "[PAPER] running docker container paper_prod"
docker container run --name paper_prod -p 80:80 paper:production