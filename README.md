# No magic!
All it is is an ubuntu base image with docker and docker-compose pre-installed. It's stupid, but it works very good OS independant.

# Primary designed for windows
By using Windows, the problems with docker can be really painful. Sometimes there is even no fix. As docker is designed to work with linux, this image can be used as docker working-space.
For example shared folders can be a pain with the boot2docker image or rsync/NFS mount points. This image is designed to use the VirtualBox Guest Additions to share folders.

# Usage
I recommend to use `Git Bash` under Windows

You can use the pre-build image. Or just clone this repository and run `vagrant up`

```
vagrant init hash/universal-docker
vagrant up

vagrant ssh
#docker and docker-compose available

```

Your home folder is by default mounted in the same path as locally (e.g `/Users/hschaeidt`)

##Optional use together with boot2docker
Add following to your Vagrantfile

```
home = ENV['HOME']

Vagrant.configure(2) do |config|
  config.vm.provision "shell", :args => '#{home}', inline: <<-SHELL
    echo 'export DOCKER_HOST=tcp://192.168.59.103:2376' >> /home/vagrant/.bashrc
    echo "export DOCKER_CERT_PATH=$1/.boot2docker/certs/boot2docker-vm"
    echo 'export DOCKER_TLS_VERIFY=1'
  SHELL
end

```

# Tweak it!
Take out the maximum of the image by increasing the CPU & Memory.
Example:
https://github.com/btopro/elmsln-vagrant/blob/master/Vagrantfile#L36

# Private repositories?
No problem.

Just add following line to your Vagrantfile

```
config.ssh.forward_agent = true
```

# "Roadmap"?!

- Reducing the image size
- Pre-installing machine and swarm