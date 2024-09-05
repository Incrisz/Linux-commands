#!/bin/bash


sudo apt update

# Define the paths to the files
FILE_TO_REMOVE="/etc/ssh/sshd_config.d/60-cloudimg-settings.conf"
NEW_FILE="/etc/ssh/sshd_config.d/ssh.conf"

# Use sudo to ensure we have the necessary permissions
# Remove the existing configuration file (if it exists)
sudo rm -f "${FILE_TO_REMOVE}"

# Create a new SSH configuration file with the desired settings
echo "Port 22
PermitRootLogin yes
PasswordAuthentication yes" | sudo tee "${NEW_FILE}" > /dev/null

# Restart SSH service to apply changes
sudo systemctl restart ssh

echo "I'm done updating ssh configuration...all thanks to Incrisz"


# chmod +x update_ssh_config.sh
