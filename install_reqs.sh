#!/bin/bash

# Install Docker
sudo apt-get -q install -y linux-headers-$(uname -r) build-essential
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get -q update
sudo apt-get -q install -y linux-image-generic-lts-trusty
sudo apt-get -q update
sudo apt-get -q install -y docker-engine
sudo usermod -aG docker vagrant

# Install Sun JDK
sudo echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
sudo apt-get -q install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -q update
sudo apt-get -q install -y oracle-java7-installer
sudo rm -rf /var/cache/oracle-jdk7-installer

# Install Apache Ant, make, tree and git
sudo apt-get -q install -y make ant git tree

# Pull Kbase SDK from github, Pull dependencies and configure the SDK
cd /home/vagrant
git clone https://github.com/kbase/kb_sdk
cd /home/vagrant/kb_sdk
make bin

# Download the local KBase SDK base Docker image
cd /home/vagrant/kb_sdk
sudo make sdkbase 

# Update users profile to recognize kb-sdk
echo "export PATH=/home/vagrant/kb_sdk/bin:$PATH" >> /home/vagrant/.profile
echo "export PATH=/home/vagrant/kb_sdk/bin:$PATH" >> /home/vagrant/.profile
echo "source /home/vagrant/kb_sdk/src/sh/sdk-completion.sh" >> /home/vagrant/.profile
