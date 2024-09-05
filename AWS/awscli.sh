# Update the list of available packages and their versions, but it does not install or upgrade any packages.
sudo apt update

# Install Python3 and the associated pip package manager.
sudo apt install python3 python3-pip

# Download the AWS CLI version 2 installer package using curl and save it with the filename "awscliv2.zip".
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded installer package.

sudo apt install unzip -y
sudo unzip awscliv2.zip

# Run the AWS CLI installation script with superuser privileges.
sudo ./aws/install

# Check the installed version of AWS CLI to ensure it's installed correctly.
aws --version




aws configure










aws iam create-role --role-name vmimport --assume-role-policy-document file:///home/ubuntu/trust-policy.json







aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document file:///home/ubuntu/role-policy.json


aws ec2 import-image --description "My server VM" --disk-containers file:///home/ubuntu/containers.json


aws ec2 describe-import-image-tasks --import-task-ids import-ami-0f497aa9bc804d145


https://www.quora.com/How-can-I-enable-virtualization-in-VMware-Virtual-Machine