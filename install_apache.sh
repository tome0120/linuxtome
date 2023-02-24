#!/bin/bash

sudo apt-get update

sudo apt install apache2 -y

sudo ufw allow 'Apache Full'

sudo systemctl status apache2

