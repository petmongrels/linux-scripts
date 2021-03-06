#!/usr/bin/env bash
# Create user sam
adduser -G wheel --home /home/sam sam # CENTOS
adduser --ingroup admin --home /home/sam sam # UBUNTU
passwd sam

# Add to sudo group
usermod -aG sudo sam # UBUNTU
usermod -aG wheel sam # CENTOS
visudo
### add following line
sam           ALL=(ALL)       NOPASSWD: ALL

# Copy sam's public key
mkdir ~/.ssh
ssh-copy-id -i ~/.ssh/id_rsa_sam.pub sam@$SERVER # LOCAL SHELL

# Public key authentication
vi /etc/ssh/sshd_config
### Update following
PubkeyAuthentication yes
PasswordAuthentication no

# To disable root login
vi /etc/ssh/sshd_config
### The update following
PermitRootLogin no