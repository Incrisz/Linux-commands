# Update the package lists for upgrades and new package installations
sudo apt update

# Upgrade all the installed packages to their latest versions
sudo apt upgrade -y

# Edit the /etc/hosts file to map your hostname to the loopback IP address
sudo nano /etc/hosts

# Add the following line to associate your hostname with the loopback address
# 172.31.31.177 isp.cyfamod.com isp

# Save and exit the file (Ctrl+O, Enter, Ctrl+X)

# Edit the /etc/hostname file to set your server's hostname
sudo nano /etc/hostname

# Replace the existing hostname with your desired hostname, e.g., isp-test
isp

# Save and exit the file (Ctrl+O, Enter, Ctrl+X)

wget -O - https://get.ispconfig.org | sh -s -- --use-ftp-ports=40110-40210 --unattended-upgrades --no-quota
# wget -O - https://get.ispconfig.org | sh -s -- --use-nginx --use-php=7.4,8.3 --use-ftp-ports=21-22 --lang=en --no-quota --unattended-upgrades -y

# After the successful installation, the ISPConfig admin password and MySQL root password will be displayed.
# Make sure to securely save these passwords, as they are essential for accessing ISPConfig.

# Finally, we can delete the log file /tmp/ispconfig-ai/var/log/setup-*. because it contains the passwords.
rm -rf /tmp/ispconfig-ai/var/log/setup-*

# Your server setup is now complete. 
# You can log in to ISPConfig by navigating to the following URL in your web browser:
# https://server-IP:8080

# Replace "server-IP" with your actual server's IP address.


[INFO] Your ISPConfig admin password is: n2gVTdZJN4SyLww
[INFO] Your MySQL root password is: d6D3ebNabCJRb4LFNm1v