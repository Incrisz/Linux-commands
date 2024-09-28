# The 'docker pull' command is used to pull an image from a docker registry.
# Here, it pulls the latest version of the 'ubuntu' image from DockerHub.
docker pull ubuntu

# The 'docker run' command is used to create and start a new container.
# '-itd' flag indicates that you want to run the container in Interactive mode (i.e., able to interact with the container),
# Detached mode (i.e., the container runs in background and gives control back to terminal).
# '--name' assigns a custom name 'my_ubuntu_container' to the container instance for easier referening later.
# 'ubuntu:latest' specifies the image (and tag) which the container should be based on. 
docker run -itd --name my_ubuntu_container ubuntu:latest

# The 'docker exec' command allows you to run commands inside a running container. 
# '-it' flag indicates you want to open an interactive session (in this case, '/bin/bash' opens a Bash shell).
# Then we specify the container ('my_ubuntu_container') where the command should be executed.
docker exec -it my_ubuntu_container /bin/bash

#go out
exit 


# now i just installed nginx inside it ..hwo do i acces it
# Stop currently running container
docker stop my_ubuntu_container

# Remove it
docker rm my_ubuntu_container

# Run the new Docker container, binding local (host) port 8080 to container's port 80
docker run -itd --name my_ubuntu_container -p 8080:80 ubuntu:latest
