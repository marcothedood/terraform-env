# Terraform Setup and Infrastructure Provisioning

## Overview
> Bootstrapping and managing infrastructure using Terraform on AWS.

This document consolidates our Terraform setup, defining how we provision our infrastructure, organize our workspace, and reference configuration files for clarity and maintainability.

## Folder Structure

```
docs/
└── terraform-bootstrap/
    ├── README.md
    ├── aws-setup.md
terraform/
├── compute/
│   ├── README.md
│   ├── main.tf
│   ├── variables.tf
├── networking/
│   ├── README.md
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── provisioning.md
├── main.tf
├── variables.tf
└── terraform.tfstate
```

## Terraform Workflow

The high-level procedure for provisioning an instance is as follows:

1. Define the provider and credentials.
2. Declare instance specifications (storage, cores, etc.).
3. Set up the network environment (VPC, subnets, security groups, firewall rules, and IPs).
4. Deploy the infrastructure with Terraform commands.

## AWS Setup

We are using AWS to deploy our instance, but Terraform supports multiple cloud providers. The official [RHEL AMIs](https://aws.amazon.com/marketplace/pp/prodview-kv5mi3ksb2mma) guide our machine selection.

- **AMI:** `ami-0717dacde6ae13b14` (64-bit x86-64)
- **Instance Type:** `t3.xlarge` (4 vCPUs, 16GB RAM)
- **Storage:**
  - Root (`/`) disk
  - 150GB EBS `/dev/sdb` (mounted at `/var/www`)
  - 50GB EBS `/dev/sdc` (mounted at `/var/lib/mysql`)
- **Access Method:** SSH Key

To keep the configuration modular, we separate the following modules:

- __Compute__ - defines hardware specifications.
- __Networking__ - sets up network rules and IPs.

## Compute Module

Located in [`terraform/compute/`](../compute/), this module defines our EC2 instance, its storage, and AMI selection. Check the configuration out in the [compute module](../../terraform/compute/).

## Networking Module

Located in [`terraform/networking/`](../networking/), this module configures our VPC, subnets, and security groups. Check the configuration details in the [networking module](../../terraform/networking/).

Additionally, we allocate an Elastic IP and associate it with the instance, then configure DNS records using Route 53.

## Infrastructure Provisioning

Once all configurations are in place, the infrastructure is deployed with:
```sh
cd terraform/
terraform init
terraform plan
terraform apply --auto-approve
```
After the `apply` command, the infrastructure will be provisioned and ready for use.

## Terraform State Management

Currently, we are storing our Terraform state locally (`terraform.tfstate`) for simplicity. In a production environment, it is recommended to store the state remotely using a backend such as AWS S3 with DynamoDB for state locking, or Terraform Cloud/Enterprise, to ensure security, consistency, and controlled access to infrastructure state changes.

---

This unified document provides a clear understanding of how our Terraform setup works while referencing modular configuration files for better maintainability.
