#!/bin/bash

sudo apt install openssh-server wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw snap freerdp2-dev freerdp2-x11 -y

sudo apt update

sudo apt upgrade -y

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/first_plus_docker.sh -O first_plus_docker.sh && chmod +x first_plus_docker.sh && ./first_plus_docker.sh && rm first_plus_docker.sh && source ~/.bashrc

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

alias bsis='bettersis'
#abbreviazione bettersis in bsis 

alias meteo='curl  wttr.in/verona'
#meteo verona

alias apti='sudo apt install $1 -y'
#apt install abbreviato ">> ~/.bashrc

echo "eseguire questo comando per abilitare le modifiche 'source ~/.bashrc' "

rm first_plus_docker.sh