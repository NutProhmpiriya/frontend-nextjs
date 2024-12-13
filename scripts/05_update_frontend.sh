#!/bin/bash

# Stop and remove existing container if it exists
if [ "$(docker ps -q -f name=frontend)" ]; then
    docker stop frontend
    docker rm frontend
fi

# Pull the latest image
docker pull $DOCKERHUB_USERNAME/frontend:latest

# Run the new container
docker run -d \
    --name frontend \
    --restart unless-stopped \
    -p 3000:3000 \
    $DOCKERHUB_USERNAME/frontend:latest
