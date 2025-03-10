variable "shared_credentials_file" {
  description = "Path to the AWS credentials file"
  type = string
  default = "replace with your path"
}

variable "aws_region" {
  description = "AWS region"
  type = string
  default = "eu-north-1" # Stockholm
}