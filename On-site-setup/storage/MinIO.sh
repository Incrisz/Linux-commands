# Display the Linux distribution information such as distributor ID, description, release number, and codename.
lsb_release -a

# Download the MinIO binary for Linux AMD64 architecture from the official MinIO download site.
wget https://dl.minio.io/server/minio/release/linux-amd64/minio

# List detailed directory contents; 'll' is typically an alias for 'ls -l' which shows permissions,
# ownership, file size, and time of last modification for all files in the current directory.
ll

# Change the permission of the downloaded MinIO binary to be executable. This allows the user to run the MinIO server.
chmod +x minio

# Start the MinIO server with '/minioapp' as the data storage directory.
# Once executed, MinIO will start serving requests and store objects in the specified directory.
./minio server /minioapp

