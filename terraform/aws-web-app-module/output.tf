// TODO: Implement AWS resource, so that AWS instance information can be retrieved dynamically in this file, through a loop

# output "aws_instances" {

# }

output "s3_state_bucket_arn" {
  value       = aws_s3_bucket.terraform_state_bucket.arn
  description = "The ARN of the S3 state bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_state_table.name
  description = "The name of the DynamoDB table"
}

output "private_key_pem" {
  value     = tls_private_key.web_server_ssh_key.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value = tls_private_key.web_server_ssh_key.public_key_openssh
}

output "web_server_public_dns" {
  value = aws_instance.ec2_server.public_dns
}

output "web_server_public_ip" {
  value = aws_instance.ec2_server.public_ip
}