terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
        }
    }
}

provider "aws" {
  region = "eu-north-1"
  shared_credentials_file = "/Users/mme/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "devmachine" {
  ami           = "ami-0717dacde6ae13b14"
  instance_type = "t3.xlarge"
  tags = {
    Name = "devmachine"
  }
}
