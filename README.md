# No magic!
All it is is an ubuntu base image with docker and docker-compose pre-installed. It's stupid, but it works very good OS independant.

# Primary designed for windows
By using Windows, the problems with docker can be really painful. Sometimes there is even no fix. As docker is designed to work with linux, this image can be used as docker working-space.
For example shared folders can be a pain with the boot2docker image or rsync/NFS mount points. This image is designed to use the VirtualBox Guest Additions to share folders.

# Usage
I recommend to use `Git Bash` under Windows

```
vagrant init hash/docker-dev-image
vagrant up

vagrant ssh
#docker and docker-compose available

```

Your home folder is by default mounted in `/vagrant`

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