resource "aws_instance" "app-server" {
  count = 1
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.app-server-sg.id]

  tags = {
    Name = "${var.name_prefix}-app-server"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.10.20260302.1-kernel-6.18-x86_64"]
  }
}

resource "aws_security_group" "app-server-sg" {
  name        = "${var.name_prefix}-app-server-sg"
  description = "Security group for app server"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.app-server-sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port        = 22
  to_port          = 22
}

output "amazon_linux_ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "amazon_linux_ami_arn" {
  value = data.aws_ami.amazon_linux.arn
}

output "amazon_linux_ami_name" {
  value = data.aws_ami.amazon_linux.name
}

variable "instance_type" {
  default = "t3.micro"
}

variable "name_prefix" {
  default = "ce12"
}
