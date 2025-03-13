### Defining the instance

The machine type here is strictly related to the official [RHEL AMIs available](https://aws.amazon.com/marketplace/pp/prodview-kv5mi3ksb2mma).

In our case, the AMI `ami-0717dacde6ae13b14` is delivered on 64-bit (x86-64) systems so we'll go for an x86-64 instance.

AWS provides us a bunch of machines with that architecture but for making sure we've enough resoruces we'll opt for a `t3.xlarge` which comes with 4 vCPUs, 16 GB RAM.

To keep our workspace well-structured we distinguish 2 different modules that we import then in our root main.tf file.

Those modules (and their respective `variables.tf` / `outputs.tf` files) are:

* `Compute`
* `Networking`

We use the [compute][compute] module to define our instance and its hardware specifications while in our [networking][networking] module we include all the necessary configurations needed to be able to connect and to open up ports and allow/deny traffic.


[compute]: ../../terraform/compute/README.md
[networking]: ../../terraform/networking/README.md