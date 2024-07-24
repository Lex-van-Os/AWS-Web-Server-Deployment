// TODO: Implement datasource to retrieve the AMI ID for the latest Ubuntu 20.04 LTS release
// TODO: Implement remote back-end (Terraform Cloud / AWS S3 with DynamoDB)

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "aws-web-app/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "web-app-state-table"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }

  required_version = ">= 1.8.0"
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

module "base_aws_web_app" {
  source = "../aws-web-app-module"

  # Input variables: (Optional, seeing how variables are set through variables.tf)

}

