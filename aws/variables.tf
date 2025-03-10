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

variable "aws_ami" {
  description = "AMI to use for the instance"
  type = string
  default = "ami-0717dacde6ae13b14" # Red Hat Enterprise Linux 8
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t3.xlarge" # 4 vCPUs, 16 GB RAM 
}

