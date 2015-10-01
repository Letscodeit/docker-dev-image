#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl

# You can install anything you need here.

# Installs latest docker client
# https://docs.docker.com/installation/ubuntulinux/
wget -qO- https://get.docker.com/ | sh

# Give the vagrant user the permission to execute docker without sudo
groupadd docker
usermod -aG docker vagrant

pip install -U docker-compose
