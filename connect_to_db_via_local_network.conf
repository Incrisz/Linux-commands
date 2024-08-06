# . Is MySQL Bound to the Correct Network Interface?
# Ensure that MySQL on your VM is bound to either all network interfaces or the specific VM network interface that your host PC can communicate with.

# Access your MySQL configuration file 

(usually /etc/mysql/my.cnf, /etc/mysql/mysql.conf.d/mysqld.cnf, or a similar path) and look for the bind-address directive.

# If it's set to 127.0.0.1, change it to 0.0.0.0 to allow binding to all network interfaces, or set it to your VM's network adapter IP address (not recommended unless necessary).
# Restart the MySQL service after changing this setting

sudo systemctl restart mysql.service
# or
sudo service mysql restart


# Create a new user or update an existing user with privileges to connect from the host IP address. Replace 'your_username'@'192.168.142.1' with the actual username and host, and 'password' with the desired password for the user:

# To create a new user:

CREATE USER 'root'@'192.168.142.1' IDENTIFIED BY '11NCrease@@';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.142.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
