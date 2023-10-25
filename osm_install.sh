#!/bin/bash

sudo apt update && sudo apt upgrade -y && sudo apt install apache2 -y && sudo a2enmod rewrite && sudo systemctl restart apache2 && sudo apt install mysql-server -y && sudo apt install php7.4 php7.4-cli php7.4-mysql php7.4-common php7.4-zip php7.4-mbstring php7.4-xmlrpc php7.4-curl php7.4-soap php7.4-gd php7.4-xml php7.4-intl php7.4-ldap php7.4-curl php7.4-json php7.4-cgi -y && cd /var/www/html && sudo mkdir osm && cd osm

echo "inserire questa riga di comando 'sudo mysql -u root -p' "

echo "inserire 
    CREATE USER 'osm'@'localhost' IDENTIFIED BY 'tomtom';
    CREATE DATABASE openstamanager;
    GRANT ALL PRIVILEGES ON openstamanager.* TO ''@'localhost';
    FLUSH PRIVILEGES;
    QUIT
    "
echo "modificare i seguenti parametri come indicato
    display_errors = Off
    max_execution_time = 180
    max_input_time = 180
    max_input_vars = 5000
    memory_limit = 512M
    post_max_size = 32M
    session.gc_maxlifetime = 1440
    upload_max_filesize = 32M
    zlib.output_compression = On
    
    nel seguente file sudo nano /etc/php/*/apache2/php.ini
    "

    sudo wget -O openstamanager.zip https://github.com/devcode-it/openstamanager/releases/download/v2.4.49/openstamanager-2.4.49.zip
    sudo unzip openstamanager.zip
    sudo rm -rf openstamanager.zip

    echo "in seguito aprire il browser e digitare indirizzo_ip/osm"

    echo "accettare la licenza e premere avanti"

    echo "inserire le credenziali di accesso al database e premere installa"

