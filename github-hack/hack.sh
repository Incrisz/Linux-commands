#!/bin/bash

# Define repository path
REPO_PATH="/var/www/html/Ai"

# Navigate to repository directory
cd $REPO_PATH || { echo "Repository path not found!"; exit 1; }

# Pull the latest changes from GitHub
git pull origin main

# Define the line to add
LINE_TO_ADD="count = 1"

# Append the line to the file
echo "$LINE_TO_ADD" >> index.php

# Add changes to git
git add index.php

# Commit changes with a message
git commit -m "Added $LINE_TO_ADD to index.php"

# Push changes to GitHub
git push origin main
