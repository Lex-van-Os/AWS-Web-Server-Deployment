resource "tls_private_key" "web_server_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "web_server_deployer" {
  key_name   = "web_server_key"
  public_key = tls_private_key.web_server_ssh_key.public_key_openssh
}