terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }

  required_version = ">= 1.8.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2_server" {
  ami           = "ami-07d20571c32ba6cdc" // Default Ubuntu 20.04 LTS, to ensure latest releases of dependencies
  instance_type = "t2.micro"

  tags = {
    Name = "DevelopmentServerInstance"
  }
}