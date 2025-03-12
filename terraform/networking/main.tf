data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "default" {
  name = "terraform-security-group"
  tags = {
    Name = "terraform-SG"
  }
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

resource "aws_security_group_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.default.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_eip" "instance" {
  instance = var.instance_id
  vpc = true
  tags = {
    Name = "TerraformEIP"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = var.instance_id
  allocation_id = aws_eip.instance.id
}

data "aws_route53_zone" "primary" {
  name = "doodlab.xyz"
}

resource "aws_route53_record" "primary" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "devm.doodlab.xyz"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.instance.public_ip]
  allow_overwrite = true
  depends_on = [aws_eip_association.eip_assoc]
}