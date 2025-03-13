RHEL8 Instance  From Scratch
---------------------
> Bootstrapping a RHEL8 machine using Terraform.

How do you provision an instance from scratch using Terraform? The
high-level procedure is pretty straightforward if you're familiar
with Cloud technologies:

1. Define the provider we are going to use and provide the service-user to interact with it.
2. Declare which type of instance we want and its specifics (storage, cores and so on).
3. Prepare the environment (subnets, security groups, firewall rules, and IP(s)).
4. Deploy the whole of that in a command.


For our example we're going to use AWS but you can target almost any provider included and specified in the Terraform Providers documentation.

Read more about out [AWS setup][aws].

[aws]: ./aws-setup.md
