#! /bin/bash

if [ -d "/tmp/dockers" ]; then
    echo "/tmp/dockers exists delete it"
    rm -rf /tmp/dockers
fi

echo "cloning development docker file"
git clone git@github.com:f3ltron/dockers.git /tmp/dockers

echo "build image locally"
docker build --file /tmp/dockers/Dockerfile.development --tag paper:development --no-cache .

if  docker container inspect paper_dev > /dev/null; then
    echo "[PAPER] docker container paper_dev exist deleting it"
    docker container rm -f paper_dev
fi

echo "[PAPER] running docker container paper_dev"
docker container run --name paper_dev -v $(pwd):/usr/src/app -p 3000:8080 paper:development