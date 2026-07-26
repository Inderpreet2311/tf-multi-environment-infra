# Project 1 — Multi-Environment Infrastructure
![Terraform](https://img.shields.io/badge/Terraform-1.5%2B-7B42BC?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws)
![License](https://img.shields.io/badge/License-MIT-green)

## Overview

This project provisions three fully isolated environments — **dev**, **staging**, and **production** — on AWS using Terraform workspaces and reusable modules. Each environment is identical in architecture but independently configurable in size, capacity, and cost.

This mirrors how real enterprise teams manage infrastructure at scale — one codebase, multiple environments, zero manual configuration.

---

## Architecture

```
┌─────────────────────────────────────────────────────┐
│                   Terraform Code                    │
│              (Single Source of Truth)               │
└──────────────┬──────────────┬──────────────┬────────┘
               │              │              │
         workspace          workspace     workspace
            dev             staging         prod
               │              │              │
        ┌──────▼──────┐ ┌─────▼──────┐ ┌────▼───────┐
        │   Dev VPC   │ │Staging VPC │ │  Prod VPC  │
        │  10.0.0.0/16│ │10.1.0.0/16 │ │10.2.0.0/16 │
        │             │ │            │ │            │
        │  t3.micro   │ │  t3.small  │ │  t3.medium │
        └─────────────┘ └────────────┘ └────────────┘
```

---

## Resources Provisioned

| Resource | Dev | Staging | Production |
|---|---|---|---|
| VPC | ✅ | ✅ | ✅ |
| Public Subnet | ✅ | ✅ | ✅ |
| Private Subnet | ✅ | ✅ | ✅ |
| Internet Gateway | ✅ | ✅ | ✅ |
| EC2 Instance | t3.micro | t3.small | t3.medium |
| Security Group | ✅ | ✅ | ✅ |

---

## Project Structure

```
project-1-multi-environment/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
├── locals.tf
├── .gitignore
└── README.md
```

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5.0
- AWS CLI configured with appropriate credentials
- An S3 bucket for remote state storage
- A DynamoDB table for state locking

---

## Remote State Configuration

This project uses an S3 backend with DynamoDB locking to manage state safely across environments.

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "project1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
```

---

## How to Deploy

**1. Clone the repository**
```bash
git clone https://github.com/your-username/tf-multi-environment-infra.git
cd tf-multi-environment-infra
```

**2. Initialize Terraform**
```bash
terraform init
```

**3. Create and select a workspace**
```bash
terraform workspace new dev
terraform workspace select dev
```

**4. Plan the deployment**
```bash
terraform plan -var-file="environments/dev.tfvars"
```

**5. Apply the configuration**
```bash
terraform apply -var-file="environments/dev.tfvars"
```

**6. Destroy resources when done**
```bash
terraform destroy -var-file="environments/dev.tfvars"
```

Repeat steps 3–6 using `staging` or `prod` workspace and corresponding `.tfvars` file for other environments.

---

## Key Concepts Demonstrated

- **Terraform Workspaces** — isolating state per environment using a single codebase
- **Reusable Modules** — writing VPC and EC2 modules once, consuming them across all environments
- **Remote State** — S3 backend with DynamoDB locking, mirroring real enterprise setup
- **Environment Specific Variables** — separate `.tfvars` files per environment
- **Resource Tagging** — every resource tagged with environment, project, and owner
- **Provider Version Pinning** — reproducible deployments across team members

---

## What I Learned

- How Terraform workspaces isolate state without duplicating code
- How to design modules that are reusable and environment agnostic
- Why remote state with locking is critical in a team environment
- How real companies manage dev, staging, and production infrastructure as code

---

## Author

**Inder** — IT Operations transitioning to Cloud Engineering  
[LinkedIn](https://linkedin.com/in/your-profile) | [GitHub](https://github.com/your-username)

---

## License

MIT License — feel free to use this as a reference for your own projects.
