#!/bin/bash

sudo apt install openssh-server sl wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw snap freerdp2-dev freerdp2-x11 -y

sudo apt update

sudo apt upgrade -y

# Aggiunge gli alias al file .bashrc
cat <<EOT >> ~/.bashrc
alias stdn='sudo shutdown now'
alias rst='sudo reboot'
alias clr='clear'
alias cclr='cd && clr'
alias ipext='curl ipinfo.io'
alias cbash='nano ~/.bashrc'
alias rbash='source ~/.bashrc'
alias meteo='curl wttr.in/verona'
alias aptu='sudo apt update && sudo apt upgrade -y'
alias ipa='ip -c a'
alias ch='history -c'
alias sn='sudo nano'
alias dc='docker-compose'
alias apti='sudo apt install \$1 -y'
alias docker='sudo docker'
EOT

read -p "Desideri abilitare le modifiche fatte (y/n)? " bashrc
if [[ "$bashrc" =~ ^[Yy]$ ]]; then
    source ~/.bashrc
else
    echo "Modifiche non abilitate"
fi

rm script.sh