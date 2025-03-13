## Terraform setup

We've put together some docs to explain how the whole show runs:

* [AWS Setup][aws-setup]. To understand what components are we using and how is our workspace organized.
* __Terraform modules.__ An overview of the small modules we implemented and their purposes:
  * [Compute][compute].  Gives info about hardware, the AMI, etc..
  * [Networking][networking].  Explains our network environment and its configuration.
* [Infra provisioning][infra]. Simple commands to run the show.



[infra]: ../terraform/provisioning.md
[aws-setup]: ./terraform-bootstrap/aws-setup.md
[compute]: ../terraform/compute/README.md
[networking]: ../terraform/networking/README.md