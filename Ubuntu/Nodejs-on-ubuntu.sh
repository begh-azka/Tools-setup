#!bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

sudo apt install -y nodejs

node --version
