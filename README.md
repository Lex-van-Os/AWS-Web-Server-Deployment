# AWS-Web-Server-Deployment

A project for automated web server deployment on AWS, by making use of provisioning and configuration management

## Description

This project serves as an example project for the easy set-up of a default Flask application on a simple AWS infrastructure, together with best practice implementation for networking and security.

The motivation for this project is to get familiar with the DevOps subjects of provisioning and configuration management. Because of this, the main drivers of this project functionality will be Terraform and Ansible.

## Functionality

### AWS services

- EC2
- S3
- DynamoDB
- Security Group(s)
- IAM(?)
- ELB(?)

---

### AWS CDK / SDK

- Boto3

---

### Terraform

- EC2 provisioning
- S3 provisioning for configuration files, logs and Terraform state
- DynamoDB provisioning
- Security group configuration
- IAM policies / roles
- ELB (In case of multiple EC2 scenario)

---

### Ansible

- Installing of web server on EC2
- Deploying of Flask app on EC2
- Running of web server on EC2

---

### Python

- Simple web application through Flask

---

### CI/CD

- Automated provisioning & configuration management through GitHub Actions
