#!/bin/bash

# Aggiunge gli alias al file .bashrc
cat <<EOT >> ~/.bashrc
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
source ~/.bashrc


# Aggiorna i pacchetti installati
sudo apt update
sudo apt upgrade -y

# Installa i pacchetti richiesti
sudo apt install openssh-server sl wget python3 curl git nano htop make perl gcc bison flex build-essential software-properties-common apt-transport-https ufw freerdp2-dev freerdp2-x11 docker.io docker-compose -y

# Aggiorna i pacchetti installati
sudo apt update
sudo apt upgrade -y

# Verifica se le app di sono installate
if [ -x "$(command -v docker)" ]; then
  echo "Docker è installato"
else
  echo "Docker non è installato"
fi

if [ -x "$(command -v docker-compose)" ]; then
  echo "Docker Compose è installato"
else
  echo "Docker Compose non è installato"
fi

if [ -x "$(command -v sl)" ]; then
  echo "sl è installato"
else
  echo "sl non è installato"
fi

if [ -x "$(command -v wget)" ]; then
  echo "wget è installato"
else
  echo "wget non è installato"
fi

if [ -x "$(command -v python3)" ]; then
  echo "python3 è installato"
else
  echo "python3 non è installato"
fi

if [ -x "$(command -v curl)" ]; then
  echo "curl è installato"
else
  echo "curl non è installato"
fi

if [ -x "$(command -v git)" ]; then
  echo "git è installato"
else
  echo "git non è installato"
fi

if [ -x "$(command -v nano)" ]; then
  echo "nano è installato"
else
  echo "nano non è installato"
fi

if [ -x "$(command -v htop)" ]; then
  echo "htop è installato"
else
  echo "htop non è installato"
fi

if [ -x "$(command -v make)" ]; then
  echo "make è installato"
else
  echo "make non è installato"
fi

if [ -x "$(command -v perl)" ]; then
  echo "perl è installato"
else
  echo "perl non è installato"
fi

if [ -x "$(command -v gcc)" ]; then
  echo "gcc è installato"
else
  echo "gcc non è installato"
fi

if [ -x "$(command -v bison)" ]; then
  echo "bison è installato"
else
  echo "bison non è installato"
fi

if [ -x "$(command -v flex)" ]; then
  echo "flex è installato"
else
  echo "flex non è installato"
fi

if [ -x "$(command -v build-essential)" ]; then
  echo "build-essential è installato"
else
  echo "build-essential non è installato"
fi

if [ -x "$(command -v software-properties-common)" ]; then
  echo "software-properties-common è installato"
else
  echo "software-properties-common non è installato"
fi

if [ -x "$(command -v apt-transport-https)" ]; then
  echo "apt-transport-https è installato"
else
  echo "apt-transport-https non è installato"
fi

if [ -x "$(command -v ufw)" ]; then
  echo "ufw è installato"
else
  echo "ufw non è installato"
fi

if [ -x "$(command -v freerdp2-dev)" ]; then
  echo "freerdp2-dev è installato"
else
  echo "freerdp2-dev non è installato"
fi

if [ -x "$(command -v freerdp2-x11)" ]; then
  echo "freerdp2-x11 è installato"
else
  echo "freerdp2-x11 non è installato"
fi





   


# Chiede all'utente se vuole un riepilogo di tutti gli alias aggiunti/creati
read -p "Vuoi un riepilogo di tutti gli alias aggiunti/creati? (y/n)" riepilogo
if [[ "$riepilogo" =~ ^[Yy]$ ]]; then

  # Mostra un riepilogo di tutti gli alias aggiunti/creati
  echo "Alias per spegnere il pc: stdn"
  echo "Alias per riavviare il pc: rst"
  echo "Alias per pulire il terminale: clr"
  echo "Alias per pulire il terminale e andare nella cartella home: cclr"
  echo "Alias per vedere l'ip pubblico: ipext"
  echo "Alias per modificare il file .bashrc: cbash"
  echo "Alias per riavviare il file .bashrc: rbash"
  echo "Alias per vedere il meteo: meteo"
  echo "Alias per aggiornare i pacchetti installati: aptu"
  echo "Alias per vedere l'ip: ipa"
  echo "Alias per pulire la cronologia della cli: ch"
  echo "Alias per aprire un file con nano come root: sn"
  echo "Alias per docker-compose: dc"
  echo "Alias per installare un pacchetto: apti"
fi



# Chiede all'utente se vuole installare un programma con apt install che non è presente nella lista
read -p "Vuoi installare un programma che non è presente nella lista? usando apt (y/n)" aptinstall
if [[ "$aptinstall" =~ ^[Yy]$ ]]; then

  # Chiede all'utente quale programma vuole installare
  read -p "Quale programma vuoi installare? " program

  # Installa il programma
  sudo apt install $program
fi

# Chiede all'utente se vuole creatre un alias  che quando scrive stdn gli chiede se vuole spegnere il pc
read -p "Vuoi creare un alias che quando scrivv stdn ti chiede se vuole spegnere il pc? (y/n)" stdn
if [[ "$stdn" =~ ^[Yy]$ ]]; then

  # Crea gli alias per spegnere il pc
  cat << EOF >> ~/.bashrc
  alias stdn='echo "Vuoi spegnere il pc? (y/n)" && read spegnere && if [[ "\$spegnere" =~ ^[Yy]$ ]]; then sudo shutdown now ; else echo "Spegnimento annullato" ; fi'
EOF
fi

# Chiede all'utente se vuole creare un alias che quando scrive rst gli chiede se vuole riavviare il pc
read -p "Vuoi creare un alias che quando scrivv rst ti chiede se vuole riavviare il pc? (y/n)" rst
if [[ "$rst" =~ ^[Yy]$ ]]; then

  # Crea gli alias per riavviare il pc
  cat << EOF >> ~/.bashrc
  alias rst='echo "Vuoi riavviare il pc? (y/n)" && read riavviare && if [[ "\$riavviare" =~ ^[Yy]$ ]]; then sudo reboot ; else echo "Riavvio annullato" ; fi'
EOF
fi

# Chiede all'utente se vuole creare un alias che non e presente nella lista
read -p "Vuoi creare un alias che non è presente nella lista? (y/n)" aliasnonpresente
if [[ "$aliasnonpresente" =~ ^[Yy]$ ]]; then

  # Chiede all'utente quale alias vuole creare
  read -p "Quale alias vuoi creare? " alias

  # Chiede all'utente cosa deve fare l'alias
  read -p "Cosa deve fare l'alias? " aliascommand

  # Crea l'alias
  cat << EOF >> ~/.bashrc
  alias $alias='$aliascommand'
EOF
source ~/.bashrc
fi


