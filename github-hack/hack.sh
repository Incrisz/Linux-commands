#!/bin/bash

# Define repository path
REPO_PATH="/var/www/html/Ai"

# Navigate to repository directory
cd $REPO_PATH || { echo "Repository path not found!"; exit 1; }

# Pull the latest changes from GitHub
git pull origin main

# Increment the number in index.php
FILE="index.php"
if [ -f "$FILE" ]; then
    # Assuming the file has a line with count = <number>
    awk '{if($0 ~ /count = /) {$0="count = " ++count} print}' $FILE > tmpfile && mv tmpfile $FILE
else
    echo "File $FILE not found!"
    exit 1
fi

# Add changes to git
git add $FILE

# Commit changes with a message
git commit -m "Incremented count in index.php"

# Push changes to GitHub
git push origin main
