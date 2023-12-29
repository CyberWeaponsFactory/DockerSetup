#!/bin/bash

# update package lists
sudo apt update

# upgrade packages
sudo apt dist-upgrade -y

# installing packages for Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce -y
sudo apt install docker-compose -y
sudo usermod -aG docker ${USER}

# installing and setting up Docker Portainer for Management of Containers
sudo docker pull portainer/portainer
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
sudo apt update
