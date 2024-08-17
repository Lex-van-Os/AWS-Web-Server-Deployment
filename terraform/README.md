# Terraform

This part of the Web Server Deployment project serves the functionality for provisioning, through Terraform. Further documentation will be added as this project evolves

## Used practices

### Modules project architecture

To make it possible to provision multiple variations of the same infrastructure, the decision has been made to divide the codebase and configuration up into a module architecture.

### Terraform remote back-end

To provision and make use of the Terraform state files in a best practice fashion, this project includes functionality for a remote back-end by making use of an AWS S3 bucket and DynamoDB table. This set-up will simulate a scenario in which multiple people can safely work in the same Terraform environment and share the state files.

### Automated SSH configuration

By making use of the Terraform tls provider, the process of generating necessary AWS SSH files is simplified. With the use of this provider, the user can easily connect to the EC2 instance(s) through their local PC, or AWS Instance Connect.

### Terraform Provisioners (Ansible)

WIP: To integrate configuration management with Ansible.

## AWS services configuration

### EC2

To make it possible to host a Flask application, an EC2 instance is provided through Terraform configuration.

### S3 for general configuration

To host any necessary configuration files and logs, for the entire infrastructure, an S3 bucket is provided through Terraform configuration.

### S3 bucket for remote back-end

To make use of Terraform according to best practice, by creating the posibility to safely collaborate on the same Terraform codebase, an S3 bucket should be configured for storing the Terraform state.

### DynamoDB for remote back-end

To make use of Terraform according to best practice, by creating the posibility to safely collaborate on the same Terraform codebase, to apply Terraform state locking.

### Security groups

To ensure that the provisioned instances are well secured and least privilege is ensured, a security group is configured.

### VPC, Subnets, Route Table, etc.

To make it possible to connect to the EC2 instance(s) by making use of SSH access, the VPC, subnets, and other related networking modules, have been configured to allow access over the internet and over SSH.

### IAM

To further ensure least privilege and to provide best practices for authentication and access to the infrastructure, IAM is also configured through Terraform configuration.

## Configuring the project

To make full use of the project functionality, a few configurations have to be made.

### terraform.tfvars configuration

**my_ssh_ip**: Used for configuring security group rules, to allow SSH access from the local PC

- my_ssh_ip = "your_ip_address"

## Running the Terraform configuration

To run the Terraform configuration, one must take several steps, seeing how certain resources have to be initialized in a certain order.

### Provisioning the AWS infrastructure

1. Ensure that the back-end block in the aws-web-app/main.tf file is commented
2. Ensure you're inside of the 'aws-web-app' folder
3. Run the 'terraform init' command
4. Ensure proper provisioning with the 'terraform plan' command
5. Provision the infrastructure with the 'terraform apply' command

### Configuring the remote back-end state

1. Uncomment the back-end block in the aws-web-app/main.tf file
2. Run the 'terraform init -backend-config=backend.hcl' command
3. Apply the state changes with the 'terraform apply' command

## Connecting to the web server

1. Run the Terraform configuration as mentioned above.
2. (Optional): Firstly ensure that there is no web_server_key.pem file stored in the keys folder
3. Export the web server key as an output variable:
   ```bash
   terraform output -raw private_key_pem > keys/web_server_key.pem
   ```
4. The web server key will be stored in the aws-web-app/keys folder.
5. Set the correct permissions for your key:
   ```bash
   chmod 400 keys/web_server_key.pem
   ```
6. Run the following command:
   ```bash
   ssh -i keys/web_server_key.pem ubuntu@<your_server_ip>
   ```

## Server configuration with Ansible

1. Provision the EC2 server using 'terraform apply', and then copy the outputted IP address
2. Define the EC2 server IP in the ./ansible/web_server_inventory.ini file, under the defined host
3. Make sure you've exported the web server key, as explained in the step above: 'Connecting to the web server'
4. Test proper configuration application, by making use of the --check flag:
   ```bash
   ansible-playbook -i web_server_inventory.ini --check playbook.yml
   ```
5. Run the Ansible configuration using:
   ```bash
   ansible-playbook -i web_server_inventory.ini playbook.yml
   ```
