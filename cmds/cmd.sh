# Be careful when using this command, as it is irreversible.

# Delete all files and folders in the current directory
rm -rf *

# If you want to keep the directory itself, but delete all of its contents, you can use the following command instead:

rm -rf ./*

# to zip a folder
zip -r my_documents.zip Documents

# pull when a server doesn't have ssl cert
wget --no-check-certificate https://13.244.101.195/school.zip

# To move all content in the current folder to another folder on Linux

mv ./* new_folder

# to move all content in the current directory to a folder named new_folder, prompting before overwriting any files or subdirectories
mv -i ./* new_folder

#  To move all content in the current folder to another folder, including hidden files, on Linux
mv -a ./* new_folder

# check filesize
du -sh


# Count all files (including hidden files) in a directory and its subdirectories:
find deploy -type f | wc -l

# Count all files in /var/www/html/open/supermart:
find /var/www/html/open/supermart -type f | wc -l

# Count all directories in /var/www/html/open/supermart:
find /var/www/html/open/supermart -type d | wc -l

# Count all files including hidden files in /var/www/html/open/supermart:
find /var/www/html/open/supermart -type f -print | wc -l


# output number of file and the size
echo "Number of files: $(find /var/www/html/open/supermart -type f | wc -l)" && echo "Total size: $(du -sh /var/www/html/open/supermart | awk '{print $1}')"

# Splitting the Archive:
zip -r -s 100m work.zip supermart/

# OR
tar -cvzf deploy.tar.gz deploy/

# Reassembling and Extracting the Archive:
unzip work.zip


# The ssconvert command from the Gnumeric suite can convert Excel files to CSV, which you can then view with standard Linux commands.
sudo apt-get install gnumeric

# Convert the Excel file to CSV:
ssconvert matched_products.xlsx file.csv

# View the CSV file:

cat file.csv





