#!/bin/bash

# Variables for the provisioning and configuration of the web application environment
KEY_NAME="my-key-pair"

# Function to handle errors and exit the script
handle_error() {
    echo "An error occurred. Exiting..."
    terraform destroy -auto-approve
    exit 1
}

# Set the error handler
trap handle_error ERR

# Step 1: Run Terraform to provision the web application environment
echo "Initializing Terraform..."
cd terraform/aws-web-app
terraform init

echo "Provisioning the web application environment..."
terraform apply -auto-approve

echo "Provisioning complete."

# Step 2: Export the private key to the local machine
echo "Exporting the private key..."
terraform output -raw private_key_pem > keys/web_server_key.pem

echo "Setting the permissions for the private key..."
chmod 400 keys/web_server_key.pem

echo "Private key exported."

# Step 3: Run Ansible to configure the web application environment
echo "Configuring the web application environment..."
cd ../../ansible
ansible-playbook -i inventory/hosts playbook.yml