# Shared variables

variable "shared_environment_tag" {
  type        = string
  description = "Name of the resource environment tag"
  default     = "Development"
}

variable "default_region" {
  type        = string
  description = "Default AWS region"
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

# web app S3 variables

variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "web-app-bucket-43219"
}

variable "s3_bucket_tags" {
  type        = map(string)
  description = "Tags for the S3 bucket"
  default = {
    Name        = "S3 bucket for web app"
    Environment = "Development"
  }
}

variable "s3_force_destroy" {
  type        = bool
  description = "Flag to enable force destroy for S3 bucket"
  default     = false
}

# S3 state bucket variables

variable "s3_state_bucket_name" {
  type        = string
  description = "S3 state bucket name"
  default     = "terraform-state-bucket-94320"
}

variable "s3_state_bucket_tags" {
  type        = map(string)
  description = "Tags for the S3 state bucket"
  default = {
    Name        = "S3 bucket for Terraform state"
    Environment = "Development"
  }
}

variable "s3_state_bucket_force_destroy" {
  type        = bool
  description = "Flag to enable force destroy for S3 state bucket"
  default     = true
}

# DynamoDB variables

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table"
  default     = "web-app-state-table"
}

variable "dynamodb_billing_mode" {
  type        = string
  description = "DynamoDB billing mode"
  default     = "PAY_PER_REQUEST"
}

variable "dynamodb_hash_key" {
  type        = string
  description = "DynamoDB hash key"
  default     = "LockID"
}


variable "dynamodb_table_tags" {
  type        = map(string)
  description = "Tags for the DynamoDB table"
  default = {
    Name        = "Terraform state table"
    Environment = "Development"
  }
}