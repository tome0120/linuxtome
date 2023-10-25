#!/usr/bin/env bash
sudo apt update && sudo apt upgrade && sudo apt install apache2 -y
sudo echo <!DOCTYPE html>
<html>
<head>
<title>Hello Word</title>
</head>
<body>

<h1>Hello Word</h1>
<p>Hello Word</p>

</body>
</html>
> /var/www/html/index.html

sudo mkdir /var/www/html/portes

sudo mkdir /var/www/html/portfin
