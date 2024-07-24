# Terraform

This part of the Web Server Deployment project serves the functionality for provisioning, through Terraform. Further documentation will be added as this project evolves

## EC2

To make it possible to host a Flask application, an EC2 instance is provided through Terraform configuration

## S3

To host any necessary configuration files and logs, for the entire infrastructure, an S3 bucket is provided through Terraform configuration

## Security groups

To ensure that the provisioned instances are well secured and least privilege is ensured, a security group is configured.

## IAM

To further ensure least privilege and to provide best practices for authentication and access to the infrastructure, IAM is also configured through Terraform configuration
