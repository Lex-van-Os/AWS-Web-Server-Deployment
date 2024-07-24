# Terraform

This part of the Web Server Deployment project serves the functionality for provisioning, through Terraform. Further documentation will be added as this project evolves

## Used practices

### Modules project architecture

To make it possible to provision multiple variations of the same infrastructure, the decision has been made to divide the codebase and configuration up into a module architecture

### Terraform Provisioners (Ansible)

WIP: To integrate configuration management with Ansible

### AWS services configuration

## EC2

To make it possible to host a Flask application, an EC2 instance is provided through Terraform configuration

## S3 for general configuration

To host any necessary configuration files and logs, for the entire infrastructure, an S3 bucket is provided through Terraform configuration

## S3 bucket for remote back-end

To make use of Terraform according to best practice, by creating the posibility to safely collaborate on the same Terraform codebase, an S3 bucket should be configured for storing the Terraform state

## DynamoDB for remote back-end

To make use of Terraform according to best practice, by creating the posibility to safely collaborate on the same Terraform codebase, to apply Terraform state locking

## Security groups

To ensure that the provisioned instances are well secured and least privilege is ensured, a security group is configured.

## IAM

To further ensure least privilege and to provide best practices for authentication and access to the infrastructure, IAM is also configured through Terraform configuration
