FROM ubuntu:latest

# install apache2
RUN apt update && apt upgrade -y
RUN apt install mysql-server php php-cli php-mysql php-common php-zip php-mbstring php-xmlrpc php-curl php-soap php-gd php-xml php-intl php-ldap php-curl php-json php-cgi

RUN apt update && apt install -y apache2
RUN sudo a2enmod rewrite
RUN sudo systemctl restart apache2

RUN mysql -u root -p
RUN CREATE USER 'utente_osm'@'localhost' IDENTIFIED BY 'PASSWORD';
RUN CREATE DATABASE openstamanager;
RUN GRANT ALL PRIVILEGES ON openstamanager.* TO 'utente_osm'@'localhost';
RUN FLUSH PRIVILEGES;
RUN QUIT



RUN echo "file="/etc/php/*/apache2/php.ini"" >> a.sh
RUN echo "ricerca="dysplay_errors = Off"" >> a.sh
RUN echo "sostituzione="display_errors = Off"" >> a.sh
RUN echo "ricerca2="max_execution_time = 30"" >> a.sh
RUN echo "sostituzione2="max_execution_time = 180"" >> a.sh
RUN echo "ricerca3="max_input_time = 60"" >> a.sh
RUN echo "sostituzione3="max_input_time = 180"" >> a.sh
RUN echo "ricerca4="max_input_vars = 1000"" >> a.sh
RUN echo "sostituzione4="max_input_vars = 5000"" >> a.sh
RUN echo "ricerca5="memory_limit = 128M"" >> a.sh
RUN echo "sostituzione5="memory_limit = 512M"" >> a.sh
RUN echo "ricerca6="post_max_size = 8M"" >> a.sh
RUN echo "sostituzione6="post_max_size = 32M"" >> a.sh
RUN echo "ricerca7="session.gc_maxlifetime = 1440"" >> a.sh
RUN echo "sostituzione7="session.gc_maxlifetime = 1440"" >> a.sh
RUN echo "ricerca8="upload_max_filesize = 2M"" >> a.sh
RUN echo "sostituzione8="upload_max_filesize = 32M"" >> a.sh
RUN echo "ricerca9="zlib.output_compression = Off"" >> a.sh
RUN echo "sostituzione9="zlib.output_compression = On"" >> a.sh
RUN echo " -i "s/$ricerca/$sostituzione/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca2/$sostituzione2/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca3/$sostituzione3/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca4/$sostituzione4/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca5/$sostituzione5/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca6/$sostituzione6/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca7/$sostituzione7/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca8/$sostituzione8/g" "$file"" >> a.sh
RUN echo "sed -i "s/$ricerca9/$sostituzione9/g" "$file"" >> a.sh


RUN chmod +x a.sh
RUN ./a.sh




RUN cd /var/www/html
RUN sudo chown -R www-data:www-data /var/www/html/
RUN sudo chmod -R 755 /var/www/html/
RUN sudo service apache2 restart
RUN rm -rf /var/www/html/*
RUN apt-get install -y wget
RUN apt-get install -y zip
RUN wget https://github.com/devcode-it/openstamanager/releases/download/v2.4.53/openstamanager-2.4.53.zip
RUN unzip openstamanager-2.4.53.zip
RUN cp config.example.php config.inc.php

