# Be careful when using this command, as it is irreversible.

# Delete all files and folders in the current directory
rm -rf *

# If you want to keep the directory itself, but delete all of its contents, you can use the following command instead:

rm -rf ./*

# to zip a folder
zip -r my_documents.zip Documents

# pull when a server doesn't have ssl cert
wget --no-check-certificate https://13.244.97.52/pull.zip
