## 1. Using SSH Keys
## Generate an SSH Key (if you don’t already have one):

ssh-keygen -t rsa -b 4096 -C "d9004396@gmail.com"

ssh-keygen -t rsa -b 4096 -C "d9004396@gmail.com" -f ~/.ssh/david

## nano .git/config
git remote set-url origin https://<github-token>@github.com/Eliano-sudo/Us-Web.git

## Follow the prompts to save the key (e.g., /home/youruser/.ssh/id_rsa).

git remote set-url origin https://<github-token>/Cyfamod-Technologies/web3-project.git
## Add Your SSH Key to the SSH Agent:

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa


## Add Your SSH Key to GitHub:

## Copy your SSH key to your clipboard:

cat ~/.ssh/id_rsa.pub

## Go to GitHub SSH settings, click "New SSH key," and paste your key.

## Update Your Git Remote URL to Use SSH:

## Change the remote URL of your repository to use SSH:

git remote set-url origin git@github.com:Cyfamod-Technologies/Ai.git

## Modify Your Script
## After setting up either method, your hack script will work without prompting for credentials. Make sure your script uses the updated remote URL.




## Setting Up the Cron Job
## Make sure you schedule the script to run every 10 minutes:

## Open the crontab editor:

crontab -e


## Add the following line: run every 3 hrs

0 */3 * * * /var/www/html/cd.sh

## Replace /path/to/update_index.sh with the actual path where the script is saved.

## Save and exit the crontab editor.

## Permissions
## Ensure the script has execution permissions:

chmod +x /path/to/update_index.sh
