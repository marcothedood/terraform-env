variable "instance_id" {
  description = "ID of the compute instance"
  type        = string
}

output "eip" {
  value = aws_eip.instance.public_ip
}