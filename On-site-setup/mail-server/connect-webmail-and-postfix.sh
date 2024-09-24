# IMAP settings (Dovecot)
 $config['default_host'] = 'ssl://mail.elbethelacademy.com'; # Your IMAP server hostname.
 $config['default_port'] = 993;                              # Default is 143, use 993 for SSL connections.
 $config['imap_auth_type'] = null;                           # You can specify an AUTH type (PLAIN, LOGIN, CRAM-MD5, etc.)

# SMTP settings (Postfix)
 $config['smtp_server'] = 'tls://mail.elbethelacademy.com';   # Your SMTP server hostname. Use tls:// or ssl:// as required.
 $config['smtp_port'] = 587;                                 # Commonly 25, 465 (SSL) or 587 (STARTTLS).
 $config['smtp_user'] = '%u';                                # Special variable that uses the current username for SMTP auth.
 $config['smtp_pass'] = '%p';                                # Special variable that uses the current user’s password.


cat /var/www/html/roundcube/config/config.inc.php

SET PASSWORD FOR 'roundcube'@'localhost' = PASSWORD('1ncrease');
FLUSH PRIVILEGES;
$config['db_dsnw'] = 'mysql://roundcube:1ncrease@localhost/roundcubemail';








# Update all packages and software.
# apt update refreshes the package index files from their sources via internet.
# apt upgrade installs newer versions of the apps present on the system.
sudo apt update && sudo apt upgrade -y 
sudo apt install mailutils -y

# Install postfix mail server. '-y' flag automatically answers 'yes' to any prompt during installation.
sudo apt install postfix -y
# During installation, you'll be prompted to configure Postfix. Choose the option "Internet Site" and set the system mail name (this is typically your domain name, e.g., smtp.elbethelacademy.com).

dpkg-reconfigure postfix
# Open the postfix configuration file for editing.
sudo nano /etc/postfix/main.cf

# The following aren't valid bash commands, they look like options in postfix's main.cf file. Ideally, you should use a text editor or sed to modify these lines.

# Set the mail server's hostname.
myhostname = smtp.elbethelacademy.com
mydestination = smtp.elbethelacademy.com, localhost, localhost.localdomain
relayhost =
inet_interfaces = loopback-only

# Restart the postfix service to make the changes take effect.
sudo systemctl restart postfix

telnet gmail-smtp-in.l.google.com 25
telnet mta7.am0.yahoodns.net 25

openssl s_client -connect smtp.gmail.com:465
openssl s_client -starttls smtp -crlf -connect smtp.gmail.com:25

# Use 'mail' command to send a test email
echo "This is a test email." | mail -s "Test Email" incrisz4luv@gmail.com

echo "This is the body" | mail -s "This is the subject" -a "FROM:sean@smtp.elbethelacademy.com" incrisz4luv@gmail.com

# Check mail log
sudo tail /var/log/mail.log


#!/bin/bash

sendmail -f smtp@elbethelacademy.com incrisz4luv@gmail.com <<EOF
Subject: This is the subject

This is the body
EOF
