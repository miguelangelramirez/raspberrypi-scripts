#!/bin/bash

# Script to setup Git credentials locally

# Get username and email from user
read -p "Enter your Git username: " username
read -p "Enter your Git email: " email

# Set global Git configuration
git config --global user.name "$username"
git config --global user.email "$email"

# Optionally, use a credential helper to store credentials securely
git config --global credential.helper store