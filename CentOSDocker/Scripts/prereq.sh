#! /usr/bin/bash

# Provisioning script

# Settings for Bash
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't mask errors in piped commands
set -o pipefail

# The name of the user that is going to manage the Docker service
readonly docker_admin=vagrant

# Install utilities
info "Installing utilities"

yum -y install git \
               nano \
               patch

# Install Docker
info "Installing Docker"

# Docker requires yum-utils and yum-config-manager
yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2
    
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Installing Docker CE stable
yum install docker-ce

# Optional: Docker CE edge and test repository
# yum-config-manager --enable docker-ce-edge
# yum-config-manager --enable docker-ce-test

# Set Dockeradmin
useradd -G ${docker_admin} docker

# Service management
info "Enabling services"

systemctl enable docker.service

# Test docker
info "Testing Docker installation"

docker run hello-world

# Add ports to firewall
info "Configuring firewall"

firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=5000/tcp --permanent
firewall-cmd --add-port=1433/tcp --permanent
firewall-cmd --reload