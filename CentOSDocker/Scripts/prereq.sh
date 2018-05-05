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
echo "Installing utilities"

yum -y install epel-release \
               git \
               nano \
               patch 
              
yum -y install python-pip

# Install Docker CE
echo "Installing Docker"

# Docker requires yum-utils and yum-config-manager
yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2
    
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Installing Docker CE stable
yum install -y docker-ce

# Optional: Docker CE edge and test repository
# yum-config-manager --enable docker-ce-edge
# yum-config-manager --enable docker-ce-test

# Set Dockeradmin
echo "Adding user vagrant to group docker"
usermod -aG docker ${docker_admin} 

# Service management
echo "Enabling services"
systemctl start docker.service
systemctl start firewalld.service

echo "Starting services"
systemctl enable docker.service
systemctl enable firewalld.service

# Test docker
echo "Testing Docker installation"

docker run hello-world

# Add ports to firewall
echo "Configuring firewall"
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=5000/tcp --permanent
firewall-cmd --add-port=1433/tcp --permanent
firewall-cmd --reload

# Restarting Docker service due to firewall
echo "Restarting docker.service"
systemctl restart docker.service

# Install Docker-Compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# chmod +x /usr/local/bin/docker-compose
echo "Installing docker-compose"
pip install docker-compose

echo "Testing Docker-compose"
docker-compose --version