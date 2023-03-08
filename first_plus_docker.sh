#!/bin/bash

sudo apt install openssh-server wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw snap freerdp2-dev freerdp2-x11 -y

sudo apt update

sudo apt upgrade -y

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_docker.sh -O install_docker.sh && chmod +x install_docker.sh && ./install_docker.sh && rm install_docker.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_docker_compose.sh -O install_docker_compose.sh && chmod +x install_docker_compose.sh && ./install_docker_compose.sh && rm install_docker_compose.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_portainer.sh -O install_portainer.sh && chmod +x install_portainer.sh && ./install_portainer.sh && rm install_portainer.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_apache.sh -O install_apache.sh && chmod +x install_apache.sh && ./install_apache.sh && rm install_apache.sh

source ~/.bashrc

echo "	
alias stdn='shutdown now'
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

alias hms='scrcpy -m 1024'
#connesione trammite cavo o protocollo tcpip
# di un telefono o smartphone android

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

alias apti='sudo apt install $1 -y'
#apt install abbreviato ">> ~/.bashrc

echo "eseguire questo comando per abilitare le modifiche 'source ~/.bashrc' "

rm first_plus_docker.sh