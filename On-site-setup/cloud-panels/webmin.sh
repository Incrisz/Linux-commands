#!/bin/bash

# Set the fully qualified hostname
sudo hostnamectl set-hostname webmin.cyfamod.com

# Update the package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Download the Virtualmin installation script
sudo wget http://software.virtualmin.com/gpl/scripts/install.sh

# Make the installation script executable
sudo chmod +x install.sh

# Run the Virtualmin installation script with the automatic option
# The `-y` flag will answer "yes" to all prompts automatically
sudo /bin/sh install.sh -y --hostname webmin.cyfamod.com --force --verbose



# nano /etc/webmin/miniserv.conf



# use user : root and password : {root-password}

# server size 2vcpu and 4g-RAm


drivewave

HgT9vd5iAUP3pmz


(http.request.full_uri contains "172.67.214.135:24567" and ip.src eq 172.67.214.135)