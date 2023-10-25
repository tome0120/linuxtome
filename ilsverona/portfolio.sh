#!/usr/bin/env bash
sudo apt update && sudo apt upgrade && sudo apt install apache2 -y

sudo chown -R $USER:$USER /var/www/html

cd /var/www/html
sudo mkdir portes
cd portes
touch index.html
cd ..


sudo echo "<html>" > /var/www/html/index.html
sudo echo "<head>" >> /var/www/html/index.html
sudo echo "<title>Hello Word</title>" >> /var/www/html/index.html
sudo echo "</head>" >> /var/www/html/index.html
sudo echo "<body>" >> /var/www/html/index.html
sudo echo "<h1>Hello Word</h1>" >> /var/www/html/index.html
sudo echo "<p>Hello Word</p>" >> /var/www/html/index.html
sudo echo "</body>" >> /var/www/html/index.html
sudo echo "</html>" >> /var/www/html/index.html


sudo echo "<html>" > /var/www/html/portes/index.html
sudo echo "<head>" >> /var/www/html/portes/index.html
sudo echo "<meta charset="UTF-8">" >> /var/www/html/portes/index.html
sudo echo "<title>Il Mio Portfolio</title>" >> /var/www/html/portes/index.html
sudo echo "<style>" >> /var/www/html/portes/index.html
sudo echo "body {" >> /var/www/html/portes/index.html
sudo echo "font-family: Arial, sans-serif;" >> /var/www/html/portes/index.html
sudo echo "background-color: #f4f4f4;" >> /var/www/html/portes/index.html
sudo echo "margin: 0;" >> /var/www/html/portes/index.html
sudo echo "padding: 0;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "header {" >> /var/www/html/portes/index.html
sudo echo "background-color: #333;" >> /var/www/html/portes/index.html
sudo echo "color: #fff;" >> /var/www/html/portes/index.html
sudo echo "text-align: center;" >> /var/www/html/portes/index.html
sudo echo "padding: 20px 0;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "h1 {" >> /var/www/html/portes/index.html
sudo echo "font-size: 2em;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "section {" >> /var/www/html/portes/index.html
sudo echo "max-width: 800px;" >> /var/www/html/portes/index.html
sudo echo "margin: 20px auto;" >> /var/www/html/portes/index.html
sudo echo "padding: 20px;" >> /var/www/html/portes/index.html
sudo echo "background-color: #fff;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "h2 {" >> /var/www/html/portes/index.html
sudo echo "font-size: 1.5em;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "p {" >> /var/www/html/portes/index.html
sudo echo "font-size: 1.2em;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo ".project {" >> /var/www/html/portes/index.html
sudo echo "margin-bottom: 20px;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "footer {" >> /var/www/html/portes/index.html
sudo echo "background-color: #333;" >> /var/www/html/portes/index.html
sudo echo "color: #fff;" >> /var/www/html/portes/index.html
sudo echo "text-align: center;" >> /var/www/html/portes/index.html
sudo echo "padding: 10px 0;" >> /var/www/html/portes/index.html
sudo echo "}" >> /var/www/html/portes/index.html
sudo echo "</style>" >> /var/www/html/portes/index.html
sudo echo "</head>" >> /var/www/html/portes/index.html
sudo echo "<body>" >> /var/www/html/portes/index.html
sudo echo "<header>" >> /var/www/html/portes/index.html
sudo echo "<h1>Il Mio Portfolio</h1>" >> /var/www/html/portes/index.html
sudo echo "<p>Benvenuto nel mio portfolio personale</p>" >> /var/www/html/portes/index.html
sudo echo "</header>" >> /var/www/html/portes/index.html
sudo echo "<section>" >> /var/www/html/portes/index.html
sudo echo "<h2>Chi Sono</h2>" >> /var/www/html/portes/index.html
sudo echo "<p>Ciao, sono [Il Tuo Nome]. Sono uno sviluppatore web appassionato di progettazione e sviluppo di siti web creativi e coinvolgenti.</p>" >> /var/www/html/portes/index.html
sudo echo "</section>" >> /var/www/html/portes/index.html
sudo echo "<section>" >> /var/www/html/portes/index.html
sudo echo "<h2>I Miei Progetti</h2>" >> /var/www/html/portes/index.html
sudo echo "<div class="project">" >> /var/www/html/portes/index.html
sudo echo "<h3>Progetto 1</h3>" >> /var/www/html/portes/index.html
sudo echo "<p>Descrizione del primo progetto. Qui puoi scrivere di più sui dettagli e le tecnologie utilizzate.</p>" >> /var/www/html/portes/index.html
sudo echo "</div>" >> /var/www/html/portes/index.html
sudo echo "<div class="project">" >> /var/www/html/portes/index.html
sudo echo "<h3>Progetto 2</h3>" >> /var/www/html/portes/index.html
sudo echo "<p>Descrizione del secondo progetto. Puoi anche includere collegamenti ai progetti se desideri.</p>" >> /var/www/html/portes/index.html
sudo echo "</div>" >> /var/www/html/portes/index.html
sudo echo "</section>" >> /var/www/html/portes/index.html
sudo echo "<footer>" >> /var/www/html/portes/index.html
sudo echo "<p>&copy; 2023 Il Mio Portfolio</p>" >> /var/www/html/portes/index.html
sudo echo "</footer>" >> /var/www/html/portes/index.html
sudo echo "</body>" >> /var/www/html/portes/index.html
sudo echo "</html>" >> /var/www/html/portes/index.html




