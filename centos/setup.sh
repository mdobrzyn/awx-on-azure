#!/bin/bash

WORK_USER=$(getent passwd 1000 | cut -f1 -d:)

sudo yum -y install epel-release
sudo yum -y install bzip2 device-mapper-persistent-data gcc gcc-c++ git gettext lvm2 yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y update

sudo yum -y install ansible python-pip docker-ce

sudo systemctl enable docker
sudo systemctl start docker

git clone --depth 50 https://github.com/ansible/awx.git
cd awx/installer/
ansible-playbook -i inventory install.yml

echo "DONE"#!/bin/bash

WORK_USER=$(getent passwd 1000 | cut -f1 -d:)

sudo yum -y install epel-release
sudo yum -y install bzip2 device-mapper-persistent-data gcc gcc-c++ git gettext lvm2 yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y update

sudo yum -y install ansible python-pip docker-ce

sudo systemctl enable docker
sudo systemctl start docker
sudo pip install -U docker-py

git clone --depth 50 https://github.com/ansible/awx.git
cd awx/installer/
ansible-playbook -i inventory install.yml

echo "DONE"