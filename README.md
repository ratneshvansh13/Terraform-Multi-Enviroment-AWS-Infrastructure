# AWS Multi-Tier Web Application with Terraform
---
This project demonstrates how to deploy a highly available, scalable, and secure multi-tier web application architecture on AWS using Terraform (Infrastructure as Code).


## 🏗️ Architecture Overview
---
The infrastructure is deployed within a custom Virtual Private Cloud (VPC) in the us-east-1 region across two Availability Zones (us-east-1a and us-east-1b) for high availability.

It consists of the following components:

- Networking: Custom VPC (10.0.0.0/16), Internet Gateway, 2 Public Subnets, 2 Private Subnets, and 2 NAT Gateways (one in each public subnet).
- Compute Tier: EC2 instances launched into the private subnets via an Auto Scaling Group. Instances are bootstrapped using a User Data script to install Apache (httpd) and serve a custom webpage displaying the instance's Availability Zone.
- Load Balancing: An Application Load Balancer (ALB) deployed in the public subnets to distribute incoming HTTP traffic evenly across the healthy EC2 instances.
- Auto Scaling: A Target Tracking Scaling Policy monitors average CPU utilization (targeting 50%) to automatically scale instances in and out.
- Database Tier: A Multi-AZ Amazon RDS MySQL instance deployed in the private subnets for high availability and automated failover.
- Security: Strict Security Groups (SGs):
  - ALB SG: Allows inbound HTTP (80) from the internet.
  - Web SG: Allows inbound HTTP/HTTPS only from the ALB, and SSH (22).
  - RDS SG: Allows inbound MySQL traffic (3306) only from the Web SG.

## 🚀 Features
---
Infrastructure as Code (IaC): Fully automated deployment using Terraform.
High Availability: Resources are spanned across two AZs. If one AZ fails, the application remains accessible.
Elasticity: Auto Scaling Group ensures the application scales dynamically based on CPU load.
Security Best Practices: Compute and Database resources are isolated in private subnets. Access is strictly controlled via Security Groups. EBS volumes are encrypted at rest.

---

```
## 🏗 Architecture

The infrastructure typically includes:

- VPC with public and private subnets  
- Internet Gateway  
- NAT Gateway  
- EC2 instances (or Auto Scaling Group)  
- Security Groups  
- IAM roles and policies  

---

## 📂 Project Structure
terraform-multi-env/
│
├── modules/
│ ├── vpc/
│ ├── ec2/
│ ├── alb/
│ ├── rds/
│
├── environments/
│ ├── dev/
│ ├── stage/
│ ├── prod/
│
├── providers.tf
└── variables.tf

### Structure Explanation

- `modules/` → Reusable infrastructure components  
- `environments/` → Environment-specific configurations  
- `backend.tf` → Remote state configuration  
- `providers.tf` → AWS provider configuration  
```
---

## ⚙️ How to Use

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/terraform-multi-env.git
cd terraform-multi-env

2️⃣ Navigate to Desired Environment
cd environments/dev
```
3️⃣ Initialize Terraform
```bash
terraform init
```
4️⃣ Plan Infrastructure
```bash
terraform plan
```
5️⃣ Apply Infrastructure
```bash
terraform apply
```
