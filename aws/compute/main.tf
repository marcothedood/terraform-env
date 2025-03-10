resource "aws_instance" "devmachine" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  tags = {
    Name = "devmachine"
  }
}

output "instance_id" {
  value = aws_instance.devmachine.id
}