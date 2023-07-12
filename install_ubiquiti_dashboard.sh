#!/bin/bash

sudo apt update

sudo apt install curl haveged gpg openjdk-8-jre-headless

curl https://dl.ui.com/unifi/unifi-repo.gpg | sudo tee /usr/share/keyrings/ubiquiti-archive-keyring.gpg >/dev/null

echo 'deb [signed-by=/usr/share/keyrings/ubiquiti-archive-keyring.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list > /dev/null

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O libssl1.1.deb

sudo dpkg -i libssl1.1.deb

curl https://pgp.mongodb.com/server-3.6.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/mongodb-org-server-3.6-archive-keyring.gpg >/dev/null

echo 'deb [signed-by=/usr/share/keyrings/mongodb-org-server-3.6-archive-keyring.gpg] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/3.6 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list > /dev/null

sudo apt update

sudo apt install -y mongodb-org-server

sudo systemctl enable mongod

sudo systemctl start mongod

sudo apt install unifi

