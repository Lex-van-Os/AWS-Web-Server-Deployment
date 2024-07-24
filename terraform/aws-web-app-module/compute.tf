resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami //Ubuntu AMI
  instance_type = var.ec2_instance_type

  tags = {
    Name        = var.ec2_name_tag,
    Environment = var.shared_environment_tag
  }
}

