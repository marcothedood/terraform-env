output "security_group_id" {
  value = aws_security_group.default.id
}

output "subnet_id" {
  value = tolist(data.aws_subnet_ids.default.ids)[0]  # Convert set to a list
}