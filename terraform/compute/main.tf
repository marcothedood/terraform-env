
resource "aws_instance" "devmachine" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  tags = {
    Name = "devm-rhel8-x86_64"
  }
  key_name = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id
  # Storage implementation root volume  + 2 additional volumes (primary and secondary) 
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
    iops                  = 3000
    throughput            = 125
    encrypted             = false

    tags = {
      Name = "root"
    }
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 50
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    encrypted   = false

    tags = {
      Name = "primary"
    }
  }

  ebs_block_device {
    device_name = "/dev/sdc"
    volume_size = 150
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    encrypted   = false

    tags = {
      Name = "secondary"
    }
  }
}

resource "aws_key_pair" "ssh" {
  key_name   = "terraform-aws"
  public_key = file("~/.ssh/terraform-env/aws.pub")
  tags = {
    Name = "terraform-aws"
  }
}

output "instance_id" {
  value = aws_instance.devmachine.id
}