# -*- mode: ruby -*-
# vi: set ft=ruby :

host = RbConfig::CONFIG['host_os']
if host =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  home = "/" + ENV['HOME']
  home = home.gsub(/:/, '')
else
  home = ENV['HOME']
end

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"
  
  # Mount home folder into vagrants home folder 
  config.vm.synced_folder ENV['HOME'], home

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", :args => "#{home}", inline: <<-SHELL
    # Installs latest docker client
    # https://docs.docker.com/installation/ubuntulinux/
    wget -qO- https://get.docker.com/ | sh
    
    # Give the vagrant user the permission to execute docker without sudo
    sudo groupadd docker
    sudo usermod -aG docker vagrant

    # Installs docker compose
    # https://docs.docker.com/compose/install/
    curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

    # Comment in the following 3 line to enable remote access to the official boot2docker image (much performant wow)
    # Chekout the README.md if you are not sure how to use this
    # echo 'export DOCKER_HOST=tcp://192.168.59.103:2376' >> /home/vagrant/.bashrc
    # echo "export DOCKER_CERT_PATH=$1/.boot2docker/certs/boot2docker-vm" >>/home/vagrant/.bashrc
    # echo 'export DOCKER_TLS_VERIFY=1' >> /home/vagrant/.bashrc
  SHELL
end
