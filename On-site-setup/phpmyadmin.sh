             #!/bin/bash

              # Update package list and upgrade system
              sudo apt update -y
              sudo apt upgrade -y

              # Set debconf selections for phpMyAdmin
              # Replace 'your_mysql_root_password' with the password you want to assign to the MySQL root user
              MYSQL_ROOT_PASSWORD="1ncrease"
              PHPMYADMIN_PASSWORD="1ncrease" # If you want to set a specific phpMyAdmin application password

              echo "Setting up debconf selections for phpMyAdmin..."
              sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
              sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
              sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASSWORD"
              sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_PASSWORD"
              sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_PASSWORD"

              # Install phpMyAdmin
              echo "Installing phpMyAdmin..."
              sudo apt install phpmyadmin -y

              # Configure Apache to recognize phpMyAdmin
              # echo "Configuring Apache to include phpMyAdmin configuration..."
              # echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf

              # Restart Apache to apply the changes
              echo "Restarting Apache server..."
              sudo service apache2 restart

              # Change MySQL root user authentication method and set the password
              echo "Updating MySQL root user authentication method..."
              sudo mysql -u root <<_EOF_
              ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
              FLUSH PRIVILEGES;
              exit
              _EOF_

              echo "phpMyAdmin installation and configuration completed."
