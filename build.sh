#!/bin/bash
ansible-vault view users > tmp/users.tmp
podman build -t samba .
rm tmp/users.tmp
