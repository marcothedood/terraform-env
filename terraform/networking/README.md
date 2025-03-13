# Networking setup

Since while practicing and doing this exercise we're learning Terraform, I have pre-created a VPC and an IG on AWS so to test the `data` declaration, used to "let Terraform know" that a specific resource already exist in the region we're targeting.

We'll need then to create a default `subnet` to be allowed to spin ec2 instances off.

Another important object that we need to create in order for us to define inbound and outbound rules (to manage traffic and access to the machine) is the __security group__,

The security group, as mentioned, is an object used to define firewall rules, open up ports and define spefic IPs (or range) that can interact with our instance on specific ports.

Looking at out TF configuration, we define:

* resource `"aws_security_group_rule"` `"allow_http_inbound"`
* resource `"aws_security_group_rule"` `"allow_https_inbound"`
* resource `"aws_security_group_rule"` `allow_ssh_inbound`  # from a specific IP.
* resource `"aws_security_group_rule"` `"allow_all_outbound"`

### IP and hostname available

We also define the an IP to be associated to our instance and perform some operations on our managed domain so to create 2 records with the relative newly created IP.

In our little-playground scenario it would be better to define a static IP and then to store it in a variable by defining it in our variable.tf file but, since we're experimenting, we use Amazon Elastic Ip (AWS EIP) functionality which will auto-assign an IP address to the machine.

The `resource "aws_eip" "instance"` and `resource "aws_eip_association" "eip_assoc"` declaration will do the magic.

The same IP address is then used to setup 2 records on our Route53 DNS zone for the domain:


`data "aws_route53_zone" "primary"`

`resource "aws_route53_record" "primary"`
`resource "aws_route53_record" "secondary"`