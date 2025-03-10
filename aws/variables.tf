variable "shared_credentials_file" {
  description = "Path to the AWS credentials file"
  type = string
  default = "/Users/mme/.aws/credentials"
}

variable "aws_region" {
  description = "AWS region"
  type = string
  default = "eu-north-1"
}

variable "aws_ami" {
  description = "AMI to use for the instance"
  type = string
  default = "ami-0717dacde6ae13b14"
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t3.xlarge"
}

