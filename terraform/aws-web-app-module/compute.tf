// Make use of 'depends_on' for future security group configuration

resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami //Ubuntu AMI
  instance_type = var.ec2_instance_type

  tags = {
    Name        = var.ec2_name_tag,
    Environment = var.shared_environment_tag
  }

  key_name               = aws_key_pair.web_server_deployer.key_name
  subnet_id              = aws_subnet.web_server_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}

