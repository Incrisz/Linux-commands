# export database
mysqldump -h easelow.c7aws6qwenxf.af-south-1.rds.amazonaws.com -P 3306 -u admin -p easelow > easelow.sql

mysqldump --column-statistics=0 -h easelow.c7aws6qwenxf.af-south-1.rds.amazonaws.com -P 3306 -u admin -p --databases easelow > easelow.sql
mysqldump --column-statistics=0 -h localhost -P 3306 -u root --databases easelow > easelow.sql


# Always check the security-group ti know if inbound rule allowed 3306
# enter the database container
mysql -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com -P 3306 -u admin -p

# create database

CREATE DATABASE easelow;

# to enter database 

USE easelow;
SHOW TABLES;  -- Lists all the tables in the database.
SELECT * FROM your_table_name;  -- Replace your_table_name with the actual table name to view its contents.

exit
# import database 

mysql -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com -P 3306 -u admin -p easelow < easelow.sql


# Here's a breakdown of the command:

# -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com: Specifies the hostname or IP address of the MySQL server.
# -P 3306: Specifies the port number on which the MySQL server is running. The default MySQL port is 3306.
# -u admin: Specifies the MySQL username (in this case, "admin"). You can replace "admin" with the appropriate username.
# -p: This flag tells MySQL to prompt for the password.
# easelow: This is the name of the database you want to import into.
# < easelow.sql: Indicates that you want to import data from the easelow.sql file into the specified database.