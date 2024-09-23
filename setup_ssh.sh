#!/bin/bash

echo "Setting up SSH..."
sudo apt install openssh-server -y
sudo ufw allow ssh
echo "SSH installed and ready to go."