#!/bin/bash

sudo docker stop portainer

sudo docker rm portainer

sudo docker volume create portainer_data

docker pull portainer/portainer-ce:latest

docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

sudo docker start portainer