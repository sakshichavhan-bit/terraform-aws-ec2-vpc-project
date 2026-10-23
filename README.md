# Terraform AWS EC2 VPC Project

This repository contains a Terraform configuration that deploys a basic AWS networking stack and an EC2 instance in a public subnet. It also includes a Jenkins pipeline to automate Terraform initialization, formatting, validation, planning, and applying the infrastructure.

## Project Overview

The infrastructure created by this project includes:

- An Amazon VPC named `my-vpc`
- A public subnet and a private subnet
- An Internet Gateway for internet access
- A route table associated with the public subnet
- A security group allowing inbound HTTP traffic on port 80
- An EC2 instance (`jenkins`) running in the public subnet
- Output exposing the public IP of the EC2 instance

This project is designed for learning, experimentation, and basic AWS infrastructure provisioning using Terraform.

## Architecture

The project creates the following AWS resources:

- `aws_vpc.my-vpc`
- `aws_subnet.private-subnet`
- `aws_subnet.public-subnet`
- `aws_internet_gateway.my-igw`
- `aws_route_table.my-route`
- `aws_route_table_association.public_sub`
- `aws_security_group.my-sgroup`
- `aws_instance.jenkin`

## Repository Structure

- `main.tf` – Terraform provider configuration and AWS provider setup
- `vpc.tf` – VPC, subnets, internet gateway, and route table resources
- `security_grpups.tf` – Security group with ingress and egress rules
- `ec2.tf` – EC2 instance definition
- `variable.tf` – Input variables for region, keys, instance type, AMI, and tags
- `output.tf` – Outputs such as the EC2 public IP
- `Jenkinsfile` – Jenkins pipeline for CI/CD automation
- `.gitignore` – Ignored local Terraform files and credentials
- `README.md` – Project documentation

## Prerequisites

Before running this project, make sure you have:

- An AWS account
- Terraform installed on your machine
- AWS access key and secret key configured
- A valid AWS region and EC2 AMI ID
- Basic familiarity with Terraform commands

## Required Variables

The following variables are defined in `variable.tf`:

| Variable | Description | Default |
| --- | --- | --- |
| `aws_region` | AWS region for deployment | `us-east-1` |
| `access_key` | AWS access key | `""` |
| `secret_key` | AWS secret key | `""` |
| `instance_type` | EC2 instance type | `t3.micro` |
| `security_group` | Security group name | `jenkins-sgroup-dec-2021` |
| `tag_name` | EC2 tag name | `my-ec2-instance` |
| `ami_id` | AMI ID for EC2 instance | `ami-0e2c8caa4b6378d8c` |
| `versioning` | Bucket versioning state (not actively used in this project) | `true` |
| `acl` | Bucket ACL value | `private` |
| `bucket_prefix` | Prefix for bucket names | `my-s3bucket-` |
| `tags` | Resource tags | `{ environment = "DEV", terraform = "true" }` |

## Terraform Configuration Details

### Provider

The project configures the AWS provider with:

- Region from `var.aws_region`
- Access key from `var.access_key`
- Secret key from `var.secret_key`

### VPC and Networking

The VPC is created with CIDR:

- `10.0.0.0/16`

Subnets:

- Private subnet: `10.0.1.0/24`
- Public subnet: `10.0.2.0/24`

The public subnet is associated with a route table that sends all outbound traffic to the Internet Gateway.

### Security Group

The security group allows:

- Inbound traffic on port 80 from `0.0.0.0/0`
- Outbound traffic on all ports and protocols from `0.0.0.0/0`

This is a simple example configuration and is not production hardened.

### EC2 Instance

The EC2 instance is created with:

- AMI: `var.ami_id`
- Instance type: `var.instance_type`
- Subnet: public subnet
- Public IP enabled: `true`
- Security group: `aws_security_group.my-sgroup`

## Outputs

The project exposes the following output:

- `instance_public_ip` – Public IP of the EC2 instance

## Jenkins CI/CD Pipeline

The `Jenkinsfile` runs the following stages:

1. Checkout repository
2. Terraform init
3. Terraform fmt
4. Terraform validate
5. Terraform plan
6. Terraform apply with auto approval

This allows the infrastructure to be provisioned automatically from Jenkins.

## Usage

1. Clone the repository:

```bash
git clone https://github.com/sakshichavhan-bit/terraform-aws-ec2-vpc-project.git
cd terraform-aws-ec2-vpc-project
```

2. Set your AWS credentials:

```bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_REGION="us-east-1"
```

3. Initialize Terraform:

```bash
terraform init
```

4. Review the execution plan:

```bash
terraform plan
```

5. Apply the infrastructure:

```bash
terraform apply -auto-approve
```

6. View the public IP of the EC2 instance:

```bash
terraform output
```

## Cleanup

To destroy the created AWS resources:

```bash
terraform destroy -auto-approve
```

## Notes

- This project is a basic Terraform example and should be adapted for production use.
- The access and secret keys are defined as sensitive variables and should be managed securely using environment variables, AWS profiles, or secret management tools.
- The security group is intentionally permissive for demonstration purposes.

## License

This project is provided for educational and learning purposes.

## Author

- sakshichavhan-bit

## GitHub Repository

- https://github.com/sakshichavhan-bit/terraform-aws-ec2-vpc-project

## Summary

This Terraform project demonstrates how to provision a simple AWS environment with VPC, subnets, gateway, security group, and EC2 instance. It also includes Jenkins automation for managing the Terraform lifecycle in a CI/CD workflow.
