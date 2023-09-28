#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt install apache2

sudo a2enmod rewrite

sudo systemctl restart apache2

sudo apt install mysql-server

sudo apt install -y php php-cli php-mysql php-common php-zip php-mbstring php-xmlrpc php-curl php-soap php-gd php-xml php-intl php-ldap

sudo apt install php-curl php-json php-cgi

echo "inserire questa riga di comando 'sudo mysql -u root -p' "

echo "inserire 
    CREATE USER 'utente_osm'@'localhost' IDENTIFIED BY 'PASSWORD';
    CREATE DATABASE openstamanager;
    GRANT ALL PRIVILEGES ON openstamanager.* TO 'utente_osm'@'localhost';
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
    
    nel seguente file /etc/php/7.2/apache2/php.ini
    "

    cd /var/www/html
    sudo mkdir osm
    cd osm
    sudo wget -O openstamanager.zip https://github.com/devcode-it/openstamanager/releases/download/v2.4.49/openstamanager-2.4.49.zip
    sudo unzip openstamanager.zip
    sudo rm -rf openstamanager.zip

    echo "in seguito aprire il browser e digitare indirizzo_ip/osm"

    echo "accettare la licenza e premere avanti"

    echo "inserire le credenziali di accesso al database e premere installa"

