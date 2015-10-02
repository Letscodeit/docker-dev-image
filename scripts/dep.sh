#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl

# You can install anything you need here.

# Installs latest docker client
# https://docs.docker.com/installation/ubuntulinux/
curl -sSL https://get.docker.com/ | /bin/sh

# Give the vagrant user the permission to execute docker without sudo
groupadd docker
usermod -aG docker vagrant

apt-get -y install python-pip python-dev

pip install -U docker-compose
