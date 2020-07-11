#!/bin/bash

# Update your existing list of packages
sudo apt update

# Install prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Check fingerprint
# TODO

# Add the Docker repository to APT sources
# Ubuntu 18.0
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Ubuntu 20.04 
# TODO: Check Ubuntu version ansd switch repos
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Update the package database with the Docker packages from the newly added repo
sudo apt update

# Check that you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# Manual check
# TODO automate host check
read -p "Press any key to continue... " -n 1 -s

# Install docker
sudo apt install docker-ce

# Check status is running
sudo systemctl status docker

# To avoid typing sudo whenever you run the docker command, add your username to the docker group
sudo usermod -aG docker ${USER}

