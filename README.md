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

### Linux / Unix
Your home folder is by default mounted in the same path as locally (e.g `/Users/hschaeidt` | `/home/hschaeidt`)

### Windows
Your home folder is by default mounted in the following path: `/home/vagrant/c:/hschaeidt`

##Optional use together with boot2docker
As speed matters, the boot2docker image support has been added to this image. This vagrant box can use the official boot2docker image remotely, means executing the commands like docker-compose on it.

1. Start the boot2docker virtualbox file the official way
```
# linux/unix
$ boot2docker up

# windows in git-bash
$ boot2docker.exec up
```

2. Comment in the concerned section in the Vagrantfile
3. Recreate this image by running `vagrant destroy -f && vagrant up`
4. Use it the way described in the 'Usage' section above

## Troubleshooting
Problem: Docker daemon timeout
Solution1: SSH into the boot2docker and check if the daemon is running / if not destroy and recreate the boot2docker image using boot2docker cli
```
# linux/unix
$ boot2docker help

# windows in git-bash
$ boot2docker.exec help
```

Solution2: Check if the IP-Adress matches within your Vagrantfile and your boot2docker box
```
$ boot2docker ssh
$ ip addr
```

Replace the IP-Adress if needed

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