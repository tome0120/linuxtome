#!/bin/bash

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






# Chiede all'utente se vuole installare Uptime Kuma
read -p "Vuoi installare Uptime Kuma? (y/n)" kuma

if [[ "$kuma" =~ ^[Yy]$ ]]; then

  # Avvia Uptime Kuma
  sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1

fi

# Chiede all'utente se vuole installare Nginx Proxy Manager con Docker Compose
read -p "Vuoi installare Nginx Proxy Manager con Docker Compose? (y/n)" nginxproxymanager
if [[ "$nginxproxymanager" =~ ^[Yy]$ ]]; then

  # Crea la cartella per i dati di Nginx Proxy Manager
  mkdir -p ./data
  mkdir -p ./letsencrypt

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./nginx-proxy-manager.yml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF

  # Avvia Nginx Proxy Manager
  sudo docker-compose -f nginx-proxy-manager.yml up -d
echo "Nginx Proxy Manager installato con successo"
fi

# Chiede all'utente se vuole installare chromium browser con docker compose
read -p "Vuoi installare chromium browser con docker compose? (y/n)" chromium
if [[ "$chromium" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./chromium.yml
version: "2.1"
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - CHROME_CLI=https://www.linuxserver.io/ #optional
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000
      - 3010:3001
    shm_size: "1gb"
    restart: unless-stopped
EOF

  # Avvia chromium browser
  sudo docker-compose -f chromium.yml up -d
echo "Chromium browser installato con successo"
fi

# Chiede all'utente se vuole installare dockge con docker compose
read -p "Vuoi installare dockge con docker compose? (y/n)" dockge
if [[ "$dockge" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./dockge.yml
 version: "3.8" 
 services: 
   dockge: 
     image: louislam/dockge:1 
     restart: unless-stopped 
     ports: 
       # Host Port : Container Port 
       - 5001:5001 
     volumes: 
       - /var/run/docker.sock:/var/run/docker.sock 
       - ./data:/app/data 
          
       # If you want to use private registries, you need to share the auth file with Dockge: 
       # - /root/.docker/:/root/.docker 
  
       # Your stacks directory in the host (The paths inside container must be the same as the host) 
       # ⚠️⚠️ If you did it wrong, your data could end up be written into a wrong path. 
       # ✔️✔️✔️✔️ CORRECT: - /my-stacks:/my-stacks (Both paths match) 
       # ❌❌❌❌ WRONG: - /docker:/my-stacks (Both paths do not match) 
       - /opt/stacks:/opt/stacks 
     environment: 
       # Tell Dockge where is your stacks directory 
       - DOCKGE_STACKS_DIR=/opt/stacks
EOF

  # Avvia dockge
  sudo docker-compose -f dockge.yml up -d
echo "Dockge installato con successo"
fi

# Chiede all'utente se vuole installare Portainer con Docker Compose
read -p "Vuoi installare Portainer? (y/n)" portainer
if [[ "$portainer" =~ ^[Yy]$ ]]; then

  # installa docker compose con comando
  cat << EOF > ./portainer.yml
  
sudo docker volume create portainer_data

sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /srv/portainer:/data portainer/portainer

sudo docker start portainer

sudo docker stop portainer

sudo docker rm portainer

sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
EOF
echo "Portainer installato con successo"
fi

# Chiede all'utente se vuole installare droppy con Docker Compose
read -p "Vuoi installare droppy con docker compose? (y/n)" droppy
if [[ "$droppy" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./droppy.yml
version: "2"
services:
  droppy:
    container_name: droppy
    image: silverwind/droppy
    ports:
      - 8989:8989
    volumes:
      - /docker/Droppy:/config
      - /docker/Droppy/files:/files
    restart: unless-stopped
EOF
  
    # Avvia droppy
    sudo docker-compose -f droppy.yml up -d
  echo "Droppy installato con successo"
  fi

# Chiede all'utente se vuole installare libreoffice con Docker Compose
read -p "Vuoi installare libreoffice con docker compose? (y/n)" libreoffice
if [[ "$libreoffice" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./libreoffice.yml
version: "2.1"
services:
  libreoffice:
    image: lscr.io/linuxserver/libreoffice:latest
    container_name: libreoffice
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3002:3000
      - 3003:3001
    restart: unless-stopped 
EOF
  
    # Avvia libreoffice
    sudo docker-compose -f libreoffice.yml up -d
  echo "Libreoffice installato con successo"
  fi

# Chiede all'utente se vuole installare homeassistant con Docker Compose
read -p "Vuoi installare homeassistant con docker compose? (y/n)" homeassistant
if [[ "$homeassistant" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./homeassistant.yml
version: '3'
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - /PATH_TO_YOUR_CONFIG:/config
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
    privileged: true
    network_mode: host
EOF
    
      # Avvia homeassistant
      sudo docker-compose -f homeassistant.yml up -d
    echo "Homeassistant installato con successo"
    fi

# Chiede all'utente se vuole installare remmia con Docker Compose
read -p "Vuoi installare remmia con docker compose? (y/n)" remmia
if [[ "$remmia" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./remmia.yml
version: "2.1"
services:
  remmina:
    image: lscr.io/linuxserver/remmina:latest
    container_name: remmina
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3006:3000
      - 3005:3001
    restart: unless-stopped

EOF
    
      # Avvia remmia
      sudo docker-compose -f remmia.yml up -d
    echo "Remmia installato con successo"
    
    fi

# Chiede all'utente se vuole installare vscodium con Docker Compose
read -p "Vuoi installare vscodium con docker compose? (y/n)" vscodium
if [[ "$vscodium" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./vscodium.yml
version: "2.1"
services:
  vscodium:
    image: lscr.io/linuxserver/vscodium:latest
    container_name: vscodium
    cap_add:
      - IPC_LOCK
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3007:3000
      - 3008:3001
    shm_size: "1gb"
    restart: unless-stopped
EOF
    
      # Avvia vscodium
      sudo docker-compose -f vscodium.yml up -d
echo "Vscodium installato con successo"
    
    fi

# Chiede all'utente se vuole installare Dashy con Docker Compose
read -p "Vuoi installare Dashy con docker compose? (y/n)" dashy
if [[ "$dashy" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./dashy.yml
version: "3.8"
services:
  dashy:
    # To build from source, replace 'image: lissy93/dashy' with 'build: .'
    # build: .
    image: lissy93/dashy
    container_name: Dashy
    # Pass in your config file below, by specifying the path on your host machine
    # volumes:
      # - /root/my-config.yml:/app/public/conf.yml
    ports:
      - 4000:80
    # Set any environmental variables
    environment:
      - NODE_ENV=production
    # Specify your user ID and group ID. You can find this by running `id -u` and `id -g`
    #  - UID=1000
    #  - GID=1000
    # Specify restart policy
    restart: unless-stopped
    # Configure healthchecks
    healthcheck:
      test: ['CMD', 'node', '/app/services/healthcheck']
      interval: 1m30s
      timeout: 10s
      retries: 3
      start_period: 40s
EOF

        # Avvia Dashy
        sudo docker-compose -f dashy.yml up -d
echo "Dashy installato con successo"      
fi

# Chiede all'utente se vuole installare guacamole
read -p "Vuoi installare guacamole? ricordati che non verra installato con docker compose (y/n)" guacamole
if [[ "$guacamole" =~ ^[Yy]$ ]]; then

wget https://git.io/fxZq5 -O guac-install.sh
chmod +x guac-install.sh
./guac-install.sh
rm -rf guac-install.sh

echo "Guacamole installato con successo"
echo "Per accedere a guacamole vai su http://ip-addres:8080/guacamole"
echo "Username: guacadmin"
echo "Password: guacadmin"



fi

# Chiede all'utente se vuole installare heimdall con Docker Compose
read -p "Vuoi installare heimdall con docker compose? (y/n)" heimdall
if [[ "$heimdall" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./heimdall.yml
  ---
version: "2.1"
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall:latest
    container_name: heimdall
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/appdata/config:/config
    ports:
      - 8085:80
      - 445:443
    restart: unless-stopped
EOF

        # Avvia heimdall
        sudo docker-compose -f heimdall.yml up -d
echo "Heimdall installato con successo"
fi

# Chiede all'utente se vuole installare kasm con Docker Compose
read -p "Vuoi installare kasm con docker compose? (y/n)" kasm
if [[ "$kasm" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./kasm.yml
  ---
version: "2.1"
services:
  kasm:
    image: lscr.io/linuxserver/kasm:latest
    container_name: kasm
    privileged: true
    environment:
      - KASM_PORT=443
      - DOCKER_HUB_USERNAME=USER #optional
      - DOCKER_HUB_PASSWORD=PASS #optional
      - DOCKER_MTU=1500 #optional
    volumes:
      - /path/to/data:/opt
      - /path/to/profiles:/profiles #optional
      - /dev/input:/dev/input #optional
      - /run/udev/data:/run/udev/data #optional
    ports:
      - 3034:3000
      - 4434:443
    restart: unless-stopped
EOF

        # Avvia kasm
        sudo docker-compose -f kasm.yml up -d
echo "Kasm installato con successo"
fi

# Chiede all'utente se vuole installare librespidtest con Docker Compose
read -p "Vuoi installare librespidtest con docker compose? (y/n)" librespidtest
if [[ "$librespidtest" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./librespidtest.yml
  ---
  ---
version: "2.1"
services:
  librespeed:
    image: lscr.io/linuxserver/librespeed:latest
    container_name: librespeed
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - PASSWORD=PASSWORD
      - CUSTOM_RESULTS=false #optional
      - DB_TYPE=sqlite #optional
      - DB_NAME=DB_NAME #optional
      - DB_HOSTNAME=DB_HOSTNAME #optional
      - DB_USERNAME=DB_USERNAME #optional
      - DB_PASSWORD=DB_PASSWORD #optional
      - DB_PORT=DB_PORT #optional
      - IPINFO_APIKEY=ACCESS_TOKEN #optional
    volumes:
      - /path/to/appdata/config:/config
    ports:
      - 84:80
    restart: unless-stopped

EOF

        # Avvia librespidtest
        sudo docker-compose -f librespidtest.yml up -d  
echo "Librespidtest installato con successo"
fi

# Chiede all'utente se vuole installare firefox con Docker Compose
read -p "Vuoi installare firefox con docker compose? (y/n)" firefox
if [[ "$firefox" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./firefox.yml
  ---
  ---
version: "2.1"
services:
  firefox:
    image: lscr.io/linuxserver/firefox:latest
    container_name: firefox
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000
      - 3001:3001
    shm_size: "1gb"
    restart: unless-stopped
EOF

        # Avvia firefox
        sudo docker-compose -f firefox.yml up -d
echo "Firefox installato con successo"
fi

# Chiede all'utente se vuole installare qbittorrent con Docker Compose
read -p "Vuoi installare qbittorrent con docker compose? (y/n)" qbittorrent
if [[ "$qbittorrent" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./qbittorrent.yml
 ---
version: "2.1"
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - WEBUI_PORT=8080
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 8087:8080
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped
EOF

        # Avvia qbittorrent
        sudo docker-compose -f qbittorrent.yml up -d
echo "Qbittorrent installato con successo"

fi

# Chiede all'utente se vuole installare unifi-controller con Docker Compose
read -p "Vuoi installare unifi-controller con docker compose? (y/n)" unifi
if [[ "$unifi" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./unifi.yml
---
version: "2.1"
services:
  unifi-controller:
    image: lscr.io/linuxserver/unifi-controller:latest
    container_name: unifi-controller
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - MEM_LIMIT=1024 #optional
      - MEM_STARTUP=1024 #optional
    volumes:
      - /path/to/data:/config
    ports:
      - 8443:8443
      - 3478:3478/udp
      - 10001:10001/udp
      - 8080:8080
      - 1900:1900/udp #optional
      - 8843:8843 #optional
      - 8880:8880 #optional
      - 6789:6789 #optional
      - 5514:5514/udp #optional
    restart: unless-stopped

EOF

        # Avvia unifi-controller
        sudo docker-compose -f unifi.yml up -d
echo "Unifi installato con successo"
fi

# Chiede all'utente se vuole installare wiregard con Docker Compose
read -p "Vuoi installare wiregard con docker compose? (y/n)" wiregard
if [[ "$wiregard" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./wiregard.yml
---
version: "2.1"
services:
  wireguard:
    image: lscr.io/linuxserver/wireguard:latest
    container_name: wireguard
    cap_add:
      - NET_ADMIN
      - SYS_MODULE #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - SERVERURL=wireguard.domain.com #optional
      - SERVERPORT=51820 #optional
      - PEERS=1 #optional
      - PEERDNS=auto #optional
      - INTERNAL_SUBNET=10.13.13.0 #optional
      - ALLOWEDIPS=0.0.0.0/0 #optional
      - PERSISTENTKEEPALIVE_PEERS= #optional
      - LOG_CONFS=true #optional
    volumes:
      - /path/to/appdata/config:/config
      - /lib/modules:/lib/modules #optional
    ports:
      - 51820:51820/udp
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
    restart: unless-stopped

EOF

        # Avvia wiregard
        sudo docker-compose -f wiregard.yml up -d
echo "Wiregard installato con successo"
fi

# Chiede all'utente se vuole installare wireshark con Docker Compose
read -p "Vuoi installare wireshark con docker compose? (y/n)" wireshark
if [[ "$wireshark" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./wireshark.yml
  ---
version: "2.1"
services:
  wireshark:
    image: lscr.io/linuxserver/wireshark:latest
    container_name: wireshark
    cap_add:
      - NET_ADMIN
    security_opt:
      - seccomp:unconfined #optional
    network_mode: host
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000 #optional
      - 3001:3001 #optional
    restart: unless-stopped

EOF

        # Avvia wireshark
        sudo docker-compose -f wireshark.yml up -d
echo "Wireshark installato con successo"

fi

# Chiede all'utente se vuole installare wps-office con Docker Compose
read -p "Vuoi installare wps-office con docker compose? (y/n)" wps
if [[ "$wps" =~ ^[Yy]$ ]]; then

  # Crea il file di configurazione di Docker Compose
  cat << EOF > ./wps.yml
---
version: "2.1"
services:
  wps-office:
    image: lscr.io/linuxserver/wps-office:latest
    container_name: wps-office
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000
      - 3001:3001
    shm_size: "1gb"
    restart: unless-stopped

EOF

        # Avvia wps-office
        sudo docker-compose -f wps.yml up -d
echo "Wps-office installato con successo"

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
read -p "Vuoi creare un alias che quando scrivi stdn ti chiede se vuole spegnere il pc? (y/n)" stdn
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

# Chiede all'utente se vuole creare degli alias per aggiornare portainer
read -p "Vuoi creare un alias per aggiornare portainer? (y/n)" aliasportainer
if [[ "$aliasportainer" =~ ^[Yy]$ ]]; then

  # Crea gli alias per aggiornare portainer
  cat << EOF >> ~/.bashrc
alias updateportainer='sudo docker stop portainer && sudo docker rm portainer && sudo docker pull portainer/portainer-ce:latest && sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest'

EOF
source ~/.bashrc
echo "Alias per aggiornare portainer creati con successo"
echo "Per aggiornare portainer usa il comando updateportainer"
fi

# Chiede all'utente se vuole creare degli alias per aggiornare uptimekuma
read -p "Vuoi creare un alias per aggiornare uptimekuma? (y/n)" aliasuptimekuma
if [[ "$aliasuptimekuma" =~ ^[Yy]$ ]]; then

  # Crea gli alias per aggiornare uptimekuma
  cat << EOF >> ~/.bashrc
alias updateuptimekuma='sudo docker stop uptime-kuma && sudo docker rm uptime-kuma && sudo docker pull louislam/uptime-kuma:1 && sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1'

EOF
source ~/.bashrc
echo "Alias per aggiornare uptimekuma creati con successo"
echo "Per aggiornare uptimekuma usa il comando updateuptimekuma"
fi

# Chiede all'utente se vuole un riepilogo di tutti gli alias aggiunti/creati
read -p "Vuoi un riepilogo di tutti gli alias aggiunti/creati? (y/n)" riepilogo
if [[ "$riepilogo" =~ ^[Yy]$ ]]; then

  # Mostra un riepilogo di tutti gli alias aggiunti/creati
  if [[ "$portainer" =~ ^[Yy]$ ]]; then
    echo "Alias per aggiornare portainer: updateportainer"
  fi
  if [[ "$kuma" =~ ^[Yy]$ ]]; then
      echo "Alias per aggiornare uptimekuma: updateuptimekuma"
  fi
  if [[ "$stdn" =~ ^[Yy]$ ]]; then
    echo "Alias per spegnere il pc: stdn"
  fi
  if [[ "$rst" =~ ^[Yy]$ ]]; then
    echo "Alias per riavviare il pc: rst"
  fi
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

#chiedi allutente se vuole il riepilogo di tutte le app installate con docker compose se ha risoposto y o Y per installare la singola app
read -p "Vuoi un riepilogo di tutte le app installate con docker compose? (y/n)" riepilogodockercompose
if [[ "$riepilogodockercompose" =~ ^[Yy]$ ]]; then

  if [[ "$kuma" =~ ^[Yy]$ ]]; then
    echo "Uptime Kuma e stato installato per accedere vai su http://ip-address:3001"
  fi
  if [[ "$nginxproxymanager" =~ ^[Yy]$ ]]; then
    echo "Nginx Proxy Manager e stato installato per accedere vai su http://ip-address:81"
    echo "Username:admin@example.com"
    echo "Password:changeme"
  fi
  if [[ "$chromium" =~ ^[Yy]$ ]]; then
    echo "Chromium browser e stato installato per accedere vai su http://ip-address:3000"
  fi
  if [[ "$dockge" =~ ^[Yy]$ ]]; then
    echo "Dockge e stato installato per accedere vai su http://ip-address:5001"
  fi
  if [[ "$portainer" =~ ^[Yy]$ ]]; then
    echo "Portainer e stato installato per accedere vai su http://ip-address:9443"
  fi
  if [[ "$droppy" =~ ^[Yy]$ ]]; then
    echo "Droppy e stato installato per accedere vai su http://ip-address:8989"
  fi
  if [[ "$libreoffice" =~ ^[Yy]$ ]]; then
    echo "Libreoffice e stato installato per accedere vai su http://ip-address:3002"
  fi
  if [[ "$homeassistant" =~ ^[Yy]$ ]]; then
    echo "Homeassistant e stato installato per accedere vai su http://ip-address:8123"
  fi
  if [[ "$remmia" =~ ^[Yy]$ ]]; then
    echo "Remmia e stato installato per accedere vai su http://ip-address:3006"
  fi
  if [[ "$vscodium" =~ ^[Yy]$ ]]; then
    echo "Vscodium e stato installato per accedere vai su http://ip-address:3007"
  fi
  if [[ "$dashy" =~ ^[Yy]$ ]]; then
    echo "Dashy e stato installato per accedere vai su http://ip-address:4000"
  fi
  if [[ "$guacamole" =~ ^[Yy]$ ]]; then
    echo "Guacamole e stato installato per accedere vai su http://ip-address:8080/guacamole"
    echo "Username: guacadmin"
    echo "Password: guacadmin"
  fi
  if [[ "$heimdall" =~ ^[Yy]$ ]]; then
    echo "Heimdall e stato installato per accedere vai su http://ip-address:8085"
  fi
  if [[ "$kasm" =~ ^[Yy]$ ]]; then
    echo "Kasm e stato installato per accedere vai su http://ip-address:3034"
  fi
  if [[ "$librespidtest" =~ ^[Yy]$ ]]; then
    echo "Librespidtest e stato installato per accedere vai su http://ip-address:84"
  fi
  if [[ "$firefox" =~ ^[Yy]$ ]]; then
    echo "Firefox e stato installato per accedere vai su http://ip-address:3000"
  fi
  if [[ "$qbittorrent" =~ ^[Yy]$ ]]; then
    echo "Qbittorrent e stato installato per accedere vai su http://ip-address:8087"
    echo "Username: admin"
    echo "Password: adminadmin"
  fi
  if [[ "$unifi" =~ ^[Yy]$ ]]; then
    echo "Unifi e stato installato per accedere vai su http://ip-address:8443"
  fi
  if [[ "$wiregard" =~ ^[Yy]$ ]]; then
    echo "Wiregard e stato installato per accedere vai su http://ip-address:51820"
  fi
  if [[ "$wireshark" =~ ^[Yy]$ ]]; then
    echo "Wireshark e stato installato per accedere vai su http://ip-address:3000"
  fi
  if [[ "$wps" =~ ^[Yy]$ ]]; then
    echo "Wps e stato installato per accedere vai su http://ip-address:3000"
  fi
fi

# Chiede all'utente se vuole dei template per portainer
read -p "Vuoi dei template per portainer? (y/n)" template
if [[ "$template" =~ ^[Yy]$ ]]; then

  echo "Questi sono i template disponibili"
  echo "1: https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json"
  echo "2: https://raw.githubusercontent.com/SelfhostedPro/selfhosted_templates/master/Template/portainer-v2.json"
  echo "3: https://raw.githubusercontent.com/technorabilia/portainer-templates/main/lsio/templates/templates-2.0.json"
  
fi