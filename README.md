# Playing around w/ Terraform   

## Goal
In this repo our goal is to setup a devm by using an IaC approach. 
For this purpose we're going to use Terraform, one of the most widely used and powerful tool available online.

Since we're learning the tool, we'll start by some basic stuff and as long as we learn new things and best practices we're going to tweak the config making it more structured.


## Setting up the environment

What we want is anyone (even without any tools pre-installed on his/her system) to be able to deploy the configuration so we will provide information for setting up the environment with all the necessary.

Here are the required tools:

* Terraform 
* Git
* AWS CLI
* VSCode or whatever code editor

#### Terraform

As I am running on MacOS, I downloaded Terraform ```v1.11.1
on darwin_arm64```  using the Brew package manager but here is the link where to get the TF package and the binary file as well - [Terraform Installation](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

#### AWS CLI

Concerning Amazon, to access AWS services with the AWS CLI, it is required at minimum an AWS account and IAM credentials. It is possible to open an account on Amazon for free and as well getting some free-tier resources (limited performance and specifications but possible).

Same as what we've done for Terraform, here is the link where it is possible to get the download and installation instructions from AWS itself:
[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

As of this doc writing I am running ```aws-cli/2.17.32 Python/3.11.9 Darwin/24.3.0 exe/x86_64```

##### AWS CLI Configuration

There are a lot of best practices when using IAM for setting up the CLI environment for interacting with the AWS Cloud but in this case we're going to take shortcuts so to get things done quickly.

It is necessary to create a new IAM User and IAM Group.
Then, we'll assign those policies to the group:

* EC2FullAccess (for computing purposes)
* RDSFullAccess (for DBs)
* S3FullAccess (for object storage and Terraform backend, eventually)
* IAMFullAccess
* Route53FullAccess (for domains and records)

Then, always in the IAM console, we'll create a new Access + Secret key for the newly created IAM (copy and keep them on the side)

Let's open the Terminal and run the following command:

```$ aws configure```

We'll be asked to enter the default region for the IAM user, the access key, the secret key and the default output format (JSON).

Don that, we only need to install git and clone this repo.

### Git installation

In order for us to download this repo locally it is needed to install the git cli.
Again, I will download git using Brew pckg manager but on this link there guidelines and links for all the other systems [Git Installation](https://github.com/git-guides/install-git)

On my system I have ```git version 2.39.5 (Apple Git-154)```

Once done, we can then issue this command to download the repo:

```git clone https://github.com/marcothedood/terraform-env.git```

We need to cd in the aws directory and we'll find the main.tf file.

For terraform to provide the declarated resources it is needed to issue:

```
$ terraform init
$ terraform plan
$ terraform apply
```