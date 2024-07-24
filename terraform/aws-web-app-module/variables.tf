# Shared variables

variable "shared_environment_tag" {
  type        = string
  description = "Name of the resource environment tag"
  default     = "Development"
}

variable "shared_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

# EC2 variables

variable "ec2_ami" {
  type        = string
  description = "Ubuntu AMI ID in London Region"
  default     = "ami-07d20571c32ba6cdc"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "ec2_name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "DevelopmentServerInstance"
}

# S3 variables

variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "web-app-state-bucket"
}

variable "s3_bucket_tags" {
  type        = map(string)
  description = "Tags for the S3 bucket"
  default = {
    Name        = "My bucket"
    Environment = "Development"
  }
}

variable "s3_force_destroy" {
  type        = bool
  description = "Flag to enable force destroy for S3 bucket"
  default     = false
}