# setup my linux server as a storage for all to use
sudo apt update
#!/bin/bash

# Update system repositories and install Samba
apt update
apt install -y samba samba-common-bin

# Create the shared directory if it doesn't exist
mkdir -p /home/ubuntu
chown nobody:nogroup /home/ubuntu
chmod 0777 /home/ubuntu

# Backup the original smb.conf file
cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

# Configure the new Samba share
tee -a /etc/samba/smb.conf > /dev/null <<EOT
[SharedStorage]
    comment = Shared Storage
    path = /home/ubuntu
    browseable = yes
    guest ok = yes
    read only = no
    create mask = 0777
    directory mask = 0777
EOT

# Restart Samba service
systemctl restart smbd

echo "Samba shared storage configured successfully!"


# Setting up FileRun and Nextcloud
