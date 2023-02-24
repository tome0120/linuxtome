#!/bin/bash

sudo apt install openssh-server wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw snap freerdp2-dev freerdp2-x11 -y

sudo apt update

sudo apt upgrade -y

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

alias meteo='curl  wttr.in/verona'
#meteo verona

alias apti='sudo apt install $1 -y'
#apt install abbreviato ">> ~/.bashrc

echo "eseguire questo comando per abilitare le modifiche 'source ~/.bashrc' "