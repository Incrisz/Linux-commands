# Pulls the specified Docker image from the Docker registry.
# In this case, it's pulling the 'apache2' image from the 'ubuntu' repository.
docker pull ubuntu/apache2

# Runs a new container in the background (detached mode) using the pulled image.
# -d flag means the container runs in the background
# -p flag publishes the container's port(s) to the host. Here 8080 of the host machine linked to 80 of docker.
# --name gives a name to the container for easier reference instead of using container ID
# Lastly, 'ubuntu/apache2' indicates which image to use for creating the container.
docker run -d -p 8080:80 --name my_apache_container ubuntu/apache2

# Lists all the currently running Docker containers after executing the 'run' command above
docker ps

# Executes an interactive bash shell on the running Docker container named "my_apache_container".
# This allows you to interact with that container as if you were logged into it directly.
# Exec is used to run a command in a running container
# -it makes the execution interactive so we can input subsequent commands
# '/bin/bash' starts a Bash shell inside the container
docker exec -it my_apache_container /bin/bash

# to go out of a container
exit

#change port
# Stop the running container
docker stop my_apache_container

# Remove the container
docker rm my_apache_container

# Now you can re-run the container with the new port mapping
docker run -d -p 80:80 --name my_apache_container ubuntu/apache2
