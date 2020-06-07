# Description
This projects allows you to create systemd service out of containerized Samba. The reason for this project is that I wanted to close samba in the container for home use (read assumptions). I wanted to have a quick way of adding / edititng users without a need to mess up the host os userd database. Also I wanted this configuration to be kept under version control in case I want to move it to another host. Also it was intended to be as simple as possible.

# I cannot find it on DockerHub.
This solution is having user database stored in the image, so it's not intended to be pushed to the Dockerhub. Maybe it could change in the future.

# Assumptions
* uses podman and systemd to automate runtime
* works on RHEL-relates OS (tested on Fedora 32)
* configuration entirely stored in the repository
* users base not shared with the container host
* works with selinux

# Directories
Contents of this repository assumes this hierarchy:
```
/
├── media
|   └── volume
|       ├── documents (private share)
|       └── public (public share)
└── opt
    └── samba (content of this repository)
```
Feel free to change it, but you'll have to remember about editing unitfile and/or podman-compose 



# Startup guide
Start from editing users and smb.conf file

```bash
# 1. Navigate to the repository. Create encrypted users file (check users.example)
ansible-vault encrypt users.example --output users

# 2. Run build, type password.
./build.sh

# 3. Copy unitfile.
cp container-samba.service /etc/systemd/system/

# 4. Reload systemd
systemctl daemon-reload

# 5. Run samba.
systemctl enable container-samba
```

# TODOs
* add user groups to define shares.
* make user modifications on start, so you can share the image
* improve users definition (drop ansible-vault)
* ...your input appreciated
