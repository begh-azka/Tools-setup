#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
mkdir -p ~/ansible/
