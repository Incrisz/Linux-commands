# install mail server
#!/bin/bash

# Define your domain name
MAIL_DOMAIN="elbethelacademy.com"

# Update the package list
sudo apt update

sudo apt install dovecot-core dovecot-imapd -y
# sudo systemctl list-units --type=service
sudo apt update
sudo apt install net-tools

# Install Postfix
echo "postfix postfix/mailname string $MAIL_DOMAIN" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

# Basic Postfix configuration for sending out emails
sudo postconf -e "myhostname = $MAIL_DOMAIN"
sudo postconf -e "mydestination = $MAIL_DOMAIN, localhost.localdomain, localhost"
sudo postconf -e "relayhost = "
sudo postconf -e "mynetworks = 127.0.0.0/8"
sudo postconf -e "mailbox_size_limit = 0"
sudo postconf -e "recipient_delimiter = +"
sudo postconf -e "inet_interfaces = all"

# Restart Postfix to apply changes
sudo systemctl restart postfix

echo "Basic Postfix mail server setup complete!"
