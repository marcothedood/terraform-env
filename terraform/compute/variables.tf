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

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

