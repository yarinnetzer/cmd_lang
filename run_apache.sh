#!/bin/bash
echo "Building your image..."
docker build -t yarin_apache .
echo "Running the container..."
docker run -dit --name apache-app -p 8089:80 yarin_apache