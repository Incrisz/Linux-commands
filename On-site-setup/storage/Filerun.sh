# Setting up FileRun

# Visit FileRun's download page to get the latest version of FileRun.
unzip FileRun.zip -d /path/to/your/web/directory/filerun

chown -R www-data:www-data /path/to/your/web/directory/filerun

CREATE DATABASE filerun;
GRANT ALL PRIVILEGES ON filerun.* TO 'filerun'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

# Navigate to http://<YourServerIP>/filerun in your web browser.
