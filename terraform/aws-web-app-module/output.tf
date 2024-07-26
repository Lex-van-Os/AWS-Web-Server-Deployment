// TODO: Implement AWS resource, so that AWS instance information can be retrieved dynamically in this file, through a loop

# output "aws_instances" {

# }

output "s3_state_bucket_arn" {
    value = aws_s3_bucket.terraform_state_bucket.arn
    description = "The ARN of the S3 state bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_state_table.name
  description = "The name of the DynamoDB table"
}