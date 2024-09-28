# Step 1: Update your existing list of packages. This is a good practice before installing new software.
sudo apt-get update

# Step 2: Install prerequisite packages that let apt use packages over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add Docker’s official GPG key so your system trusts the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Step 4: Add Docker repository to APT sources for fetching Docker packages   -  *
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


# Step 5: Update your package list again to fetch the latest packages from the newly added Docker repository
sudo apt-get update

# Step 6: Finally, install Docker's community edition package
sudo apt-get install docker-ce

# Step 7: Verify Docker was installed correctly by running the hello-world Docker image
# sudo docker run hello-world

# Optional Step: If you want to avoid typing `sudo` every time, add your username to the `docker` group and give it permissions over Docker operations
# sudo usermod -aG docker ${USER}
