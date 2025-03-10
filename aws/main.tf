terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
        }
    }
}

provider "aws" {
  region = var.aws_region
  shared_credentials_file = var.shared_credentials_file
  profile = "default"
}

resource "aws_instance" "devmachine" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  tags = {
    Name = "devmachine"
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "default" {
  name = "terraform-security-group"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  security_group_id = aws_security_group.default.id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  security_group_id = aws_security_group.default.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["213.55.241.218/32"]
}

resource "aws_security_group_rule" "allow_https_inbound" {
  security_group_id = aws_security_group.default.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_eip" "instance" {
  instance = aws_instance.devmachine.id
  vpc = true
}