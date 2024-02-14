#!/bin/bash

# Installazione delle dipendenze
sudo apt update && sudo apt upgrade -y
sudo apt install -y nano htop git
#installazione di postgresql
sudo apt install -y postgresql

psql -V

sudo -u postgres psql

# creo il database

CREATE DATABASE netbox;
CREATE USER netbox WITH PASSWORD 'netbox';
GRANT ALL PRIVILEGES ON DATABASE netbox TO netbox;
\connect netbox
GRANT CREATE ON SCHEMA public TO netbox;
\q

#verovico che il database sia stato creato e che l'utente abbia i permessi

psql --username netbox --password --host localhost netbox

netbox=> \conninfo

netbox=> \q

#install redis


sudo apt install -y redis-server

#verifico versione redis

redis-server -v

#verifico lo strato di redis

redis-cli ping

#installo netbox

sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev

#verifico versione python3

python3 -V

#scarico netbox

sudo mkdir -p /opt/netbox/
cd /opt/netbox/

sudo apt install -y git

sudo git clone -b master --depth 1 https://github.com/netbox-community/netbox.git .

#creo l'utenza netbox

sudo adduser --system --group netbox
sudo chown --recursive netbox /opt/netbox/netbox/media/
sudo chown --recursive netbox /opt/netbox/netbox/reports/
sudo chown --recursive netbox /opt/netbox/netbox/scripts/

#configuro

cd /opt/netbox/netbox/netbox/
sudo cp configuration_example.py configuration.py

#modifico il file di configurazione
echo "ALLOWED_HOSTS = ['*']"
echo "DATABASE = {
        'NAME': 'netbox',               # Database name
        'USER': 'netbox',               # PostgreSQL username
        'PASSWORD': 'netbox', # PostgreSQL password
        'HOST': 'localhost',            # Database server
        'PORT': '',                     # Database port (leave blank for default)
        'CONN_MAX_AGE': 300,            # Max database connection age (seconds)
    }"
    echo "REDIS = {
        'tasks': {
            'HOST': 'localhost',        # Redis server
            'PORT': 6379,               # Redis port
            'PASSWORD': '',             # Redis password (optional)
            'DATABASE': 0,              # Database ID
            'DEFAULT_TIMEOUT': 300,     # Timeout in seconds
            'SSL': False,               # Use SSL (requires python-redis>=3.4.4)
        },
        'caching': {
            'HOST': 'localhost',        # Redis server
            'PORT': 6379,               # Redis port
            'PASSWORD': '',             # Redis password (optional)
            'DATABASE': 1,              # Database ID
            'DEFAULT_TIMEOUT': 300,     # Timeout in seconds
            'SSL': False,               # Use SSL (requires python-redis>=3.4.4)
        },
    }"
echo " incolla la se"
sudo nano configuration.py