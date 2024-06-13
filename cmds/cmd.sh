# Be careful when using this command, as it is irreversible.

# Delete all files and folders in the current directory
rm -rf *

# If you want to keep the directory itself, but delete all of its contents, you can use the following command instead:

rm -rf ./*

# to zip a folder
zip -r my_documents.zip Documents

# pull when a server doesn't have ssl cert
wget --no-check-certificate https://13.244.120.171/uploads.zip

# To move all content in the current folder to another folder on Linux

mv ./* new_folder

# to move all content in the current directory to a folder named new_folder, prompting before overwriting any files or subdirectories
mv -i ./* new_folder

#  To move all content in the current folder to another folder, including hidden files, on Linux
mv -a ./* new_folder

# check filesize
du -sh
