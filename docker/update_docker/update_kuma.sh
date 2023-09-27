#!/bin/bash

sudo docker pull louislam/uptime-kuma:1

sudo docker stop uptime-kuma

sudo docker rm uptime-kuma

sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1