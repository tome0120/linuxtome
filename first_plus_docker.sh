#!/bin/bash

sudo apt install docker docker.io sl openssh-server wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw snap freerdp2-dev freerdp2-x11 -y

sudo apt update

sudo apt upgrade -y

echo "	
alias stdn='sudo shutdown now'
#comando abbreviato per lo spegnimento del computer

alias rst='sudo reboot'
#restart abbreviato

alias clr='clear'
#comando clear per pulire directori

alias cclr='cd && clr'
#combinazione di cd e clr per pulire la bash e tornare alla cartella principale

alias ipext='curl ipinfo.io'
#visione del proprio ip pubblico

alias cbash='nano ~/.bashrc'
#aprire questo file per modificare alias e funzioni della bash

alias rbash='source ~/.bashrc'
#ricaricare questo file per attivare modifiche fatte al file

alias meteo='curl wttr.in/verona'
#meteo verona

alias aptu='sudo apt update && sudo apt upgrade -y'
#aggiornamento e upgrade abbreviato

alias ipa='ip -c a'
#ip address abbreviato con colori per evidenziare gli indirizzi ip

alias ch='history -c'
#pulizia cronologia bash

alias sn='sudo nano'
#nano con permessi di root

alias dc='docker-compose'
#docker compose abbreviato

alias apti='sudo apt install $1 -y'
#apt install abbreviato ">> ~/.bashrc


sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version


sudo docker volume create portainer_data

sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /srv/portainer:/data portainer/portainer

sudo docker start portainer

sudo docker stop portainer

sudo docker rm portainer

sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest










rm first_plus_docker.sh

echo "eseguire questo comando per abilitare le modifiche 'source ~/.bashrc' "