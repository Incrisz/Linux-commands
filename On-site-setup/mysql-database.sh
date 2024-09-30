             #!/bin/bash

              # Update package information
              sudo apt update
              sudo apt install expect -y

              # Install MySQL server
              sudo apt install mysql-server -y

              # Secure MySQL installation using an expect script
              SECURE_MYSQL=$(expect -c "
              set timeout 10
              spawn sudo mysql_secure_installation

              # Answer 'Yes' to set up VALIDATE PASSWORD component
              expect \"Press y|Y for Yes, any other key for No:\"
              send \"n\r\"

              # Choose 'No' for remove anonymous users
              expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No) :\"
              send \"n\r\"

              # Choose 'No' for disallow remote root login
              expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No) :\"
              send \"n\r\"

              # Choose 'No' for remove test database
              expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No) :\"
              send \"n\r\"

              # Choose 'Yes' to reload privilege tables now
              expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) :\"
              send \"y\r\"

              expect eof
              ")

              echo "$SECURE_MYSQL"




# mysql -u root

# CREATE DATABASE mebany;
# CREATE USER 'mebany'@'localhost' IDENTIFIED BY '1ncrease';
# GRANT ALL PRIVILEGES ON mebany.* TO 'mebany'@'localhost';

# FLUSH PRIVILEGES;



# exit;



# mysql -u root -p mebany < mebany.sql
