# Compute module - definitions

## AWS Instance

As we already talked, you can get more information about our instance-related choices in our [AWS Setup documentation file][aws-setup]

Here we're going to wrap up in few points our EC2 machine.

#### Instance:

* Architecture: `x86-64`
* AMI: `ami-0717dacde6ae13b14` 
* Type: `t3.xlarge`
* Name = `"devm-rhel8-x86_64"`
* Access method: `SSH Key`


#### Storage:

The assigment was requesting us to have 2 additional disks together with the root one, so we provide the `root_block_device` and x2 `ebs_block_device`.

Also, MySQL will have to run on a separate disk.

* Root (/) disk
* 150GB EBS 1 - (/dev/sdb)
* 50GB EBS2 - (/dev/sdc)

The Ansible role sysconfig will format the disks to ext4 and then mount the `/var/www` directory on `EBS1` and `/var/lib/mysql` on `EBS2`.



[aws-setup]: ../../docs/bootstrap/README.md