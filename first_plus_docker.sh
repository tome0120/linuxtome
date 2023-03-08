#!/bin/bash

wget https://github.com/tome0120/linuxtome/blob/main/script.sh -O script.sh && chmod +x script.sh && ./script.sh && rm script.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_docker.sh -O install_docker.sh && chmod +x install_docker.sh && ./install_docker.sh && rm install_docker.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_docker_compose.sh -O install_docker_compose.sh && chmod +x install_docker_compose.sh && ./install_docker_compose.sh && rm install_docker_compose.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_portainer.sh -O install_portainer.sh && chmod +x install_portainer.sh && ./install_portainer.sh && rm install_portainer.sh

wget https://raw.githubusercontent.com/tome0120/linuxtome/main/install_apache.sh -O install_apache.sh && chmod +x install_apache.sh && ./install_apache.sh && rm install_apache.sh


rm first_plus_docker.sh