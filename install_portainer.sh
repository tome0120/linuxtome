#!/bin/bash

sudo docker volume create portainer_data

sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /srv/portainer:/data portainer/portainer

sudo docker start portainer

sudo docker stop portainer

sudo docker rm portainer

sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest