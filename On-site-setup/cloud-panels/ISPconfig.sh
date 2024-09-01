# Update the package lists for upgrades and new package installations
sudo apt update

# Upgrade all the installed packages to their latest versions
sudo apt upgrade -y

# Edit the /etc/hosts file to map your hostname to the loopback IP address
sudo nano /etc/hosts

# Add the following line to associate your hostname with the loopback address
# 172.31.88.9 ispconfig.cyfamod.com

# Save and exit the file (Ctrl+O, Enter, Ctrl+X)

# Edit the /etc/hostname file to set your server's hostname
sudo nano /etc/hostname

# Replace the existing hostname with your desired hostname, e.g., isp-test
# isp-test

# Save and exit the file (Ctrl+O, Enter, Ctrl+X)

# Reboot the server to apply the hostname changes
sudo reboot

# Download and run the ISPConfig installation script with the specified options
# This command will:
# - Use Nginx as the web server
# - Install PHP versions 7.4 and 8.3
# - Set up FTP with ports 21-22
# - Set the language to English
# - Disable disk quotas
# - Enable unattended upgrades
# The installation process will run without further prompts.
wget -O - https://get.ispconfig.org | sh -s -- --use-nginx --use-php=7.4,8.3 --use-ftp-ports=21-22 --lang=en --no-quota --unattended-upgrades -y

# After the successful installation, the ISPConfig admin password and MySQL root password will be displayed.
# Make sure to securely save these passwords, as they are essential for accessing ISPConfig.

# Your server setup is now complete. 
# You can log in to ISPConfig by navigating to the following URL in your web browser:
# https://server-IP:8080

# Replace "server-IP" with your actual server's IP address.
