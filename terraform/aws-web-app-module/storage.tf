resource "aws_s3_bucket" "web_s3_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = var.s3_force_destroy

  tags = var.s3_bucket_tags
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = var.s3_state_bucket_name
  force_destroy = var.s3_state_bucket_force_destroy

  tags = var.s3_bucket_tags
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_sse" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamo_db_table" "terraform_state_table" {
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_billing_mode
  hash_key       = var.dynamodb_hash_key
  range_key      = var.dynamodb_range_key
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity

  tags = var.dynamodb_table_tags

  attribute {
    name = var.dynamodb_hash_key
    type = "S"
  }
}