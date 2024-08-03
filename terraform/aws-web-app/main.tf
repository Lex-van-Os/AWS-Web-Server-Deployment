// TODO: Implement datasource to retrieve the AMI ID for the latest Ubuntu 20.04 LTS release
// TODO: Implement remote back-end (Terraform Cloud / AWS S3 with DynamoDB)
provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

# Back-end state configuration is to be loaded through the backend.hcl file. 
# This prevents continuous copy and paste work when manually configuring the back-end state configuration for one or multiple modules (See README)
terraform {
  # backend "s3" {
  #   key    = "global/s3/terraform.tfstate"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }

  required_version = ">= 1.8.0"
}

module "base_aws_web_app" {
  source = "../aws-web-app-module"

  # Input variables: (Optional, seeing how variables are set through variables.tf)
  my_ssh_ip = var.my_ssh_ip
}


output "s3_state_bucket_arn" {
  value = module.base_aws_web_app.s3_state_bucket_arn
}

output "dynamodb_table_name" {
  value = module.base_aws_web_app.dynamodb_table_name
}

output "private_key_pem" {
  value     = module.base_aws_web_app.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value = module.base_aws_web_app.public_key_openssh
}

output "web_server_public_dns" {
  value = module.base_aws_web_app.web_server_public_dns
}

output "web_server_public_ip" {
  value = module.base_aws_web_app.web_server_public_ip
}