#!/bin/bash

apt update && apt install wget curl git nano -y

sudo su

git clone https://github.com/K0p1-Git/cloudflare-ddns-updater

cd cloudflare-ddns-updater

cp cloudflare-template.sh cloudflare.70m3.eu.sh

cp cloudflare-template.sh cloudflare.70m3.me.sh

cp cloudflare-template.sh cloudflare.vpn.70m3.site.sh

cp cloudflare-template.sh cloudflare.vpn.70m3.it.sh

cp cloudflare-template.sh cloudflare.vpn.70m3ll3r1.it.sh

cp cloudflare-template.sh cloudflare.vpn.marcotomelleri.it.sh

echo " open this file with nano and input te value cloudflare.sh"

echo "use this command 'chmod +x cloudflare.sh' for get exeguible the cloudflare.sh"

echo "run program use this command './cloudflare.sh' "

echo "use this comand for ran evry 1 minuts 'crontab -e'"

echo "use this frase for ran evry q minuts '*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.sh'"





./cloudflare.70m3.eu.sh

./cloudflare.70m3.me.sh

./cloudflare.vpn.70m3.site.sh

./cloudflare.vpn.70m3.it.sh

./cloudflare.vpn.70m3ll3r1.it.sh

./cloudflare.vpn.marcotomelleri.it.sh


*/1	* * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.70m3.eu.sh
*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.70m3.me.sh
*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.vpn.70m3.site.sh
*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.vpn.70m3.it.sh
*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.vpn.70m3ll3r1.it.sh
*/1 * * * * /bin/bash /root/cloudflare-ddns-updater/cloudflare.vpn.marcotomelleri.it.sh