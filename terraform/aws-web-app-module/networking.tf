resource "aws_vpc" "web_server_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Web Server VPC"
  }
}

# Overwrite by custom defined VPC
# resource "aws_default_vpc" "default" {
#   tags = {
#     Name = "Default VPC"
#   }
# }

resource "aws_internet_gateway" "web_server_gateway" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "Web Server Gateway"
  }
}

resource "aws_route_table" "web_server_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_server_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_subnet" "web_server_subnet" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web Server Subnet"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.web_server_subnet.id
  route_table_id = aws_route_table.web_server_route_table.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow inbound and outbound traffic for web server"
  vpc_id      = aws_vpc.web_server_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.web_server_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.my_ssh_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.my_ssh_ip
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "fd00::/56"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# TODO: These two egress rules are to be changed later, to only allow the necessary traffic for the web server
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}