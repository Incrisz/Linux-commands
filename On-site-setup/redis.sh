# install redis 
#!/bin/bash

# Update the package list
sudo apt-get update

# Install Redis-server
sudo apt-get install -y redis-server

# Start Redis server
sudo systemctl start redis-server

# Enable Redis to start on system boot
sudo systemctl enable redis-server

echo "Redis installation and setup complete!"
