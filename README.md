# Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform-
This repo has been created to deploy an aws ecs cluster on EC2 instances with terraform step by step.

# Dockerize Node.js Project Section

## Getting Started
- The first step is to clone this repo by running command:
- `git clone https://github.com/engrbilal1/Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform-.git`

##### If you want to Check the Project that its work then do the Below 2 Steps
##### Install dependencies

- `sudo apt update`
- `sudo apt install npm -y`
- `npm install`
- `npm audit fix`
- `npm fund`
##### Run Snap Shot from the root directory

- `node index.js`

![](node.png)

## For the ECS you should do the following steps

##### Build the image

- `docker build -t node_pro:latest .`

##### Go to the ECR Repository and just check Push command provided by AWS ECR

- Now for this project  we will create a private registry on AWS, then push image to `ECR_Repo` repository.
- Then we will provision infrastructure on AWS using Terraform which is also available in the same repository.

# Terraform Section
## Infrastructure Setup Instructions
- `To set up the infrastructure, follow these steps:`

#### Clone the repository:
- `git clone https://github.com/engrbilal1/Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform-.git`
#### Navigate to the project directory:
- `cd Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform`
#### Initialize Terraform:
- `terraform init`
#### Preview the changes:
- `terraform plan`
#### Apply the changes:
- `terraform apply --auto-approve`
## Deleting the Infrastructure
- To delete the infrastructure, follow these steps:

- Terminate instances manually through the AWS Management Console or CLI.

#### Run Terraform to destroy the resources:
- `terraform destroy`

## Overview
##### The infrastructure includes the following components:

- `Virtual Private Cloud (VPC) with 2 public subnets spread across 2 availability zones.`
- `Elastic Container Service (ECS) cluster using container instances (EC2 launch type).`
- `Application Load Balancer (ALB) to distribute traffic to ECS container instances.`
## Details
#### ECS Cluster Setup (ecs.tf)
- Creates a cluster of container instances named ecs-cluster.
- Defines a capacity provider, which is an Auto Scaling group for EC2 instances. Managed scaling is enabled, with a target capacity of 85%. This ensures efficient utilization of EC2 instances.
#### Defines a task definition named web-family with a volume and container definition specified in container-def.json.
- Sets up a service named ecs-service with a desired count of 2 tasks. The REPLICA scheduler strategy is used, and an Application Load Balancer is attached to distribute traffic among tasks. The binpack task placement strategy is applied to optimize resource usage.
#### Auto Scaling Group Setup (asg.tf)
- Creates a launch configuration, key pair, security groups for EC2 instances, and an Auto Scaling group.
- For key-pair you should run **ssh-keygen** in your local env and then copy your **id_rsa.pub** to current dir.
- Enables ECS managed scaling by setting **protect_from_scale_in** to true in the Auto Scaling group configuration.
#### IAM Setup (iam.tf)
- `Creates roles to associate EC2 instances with clusters and perform other necessary tasks.`
#### Application Load Balancer Setup (alb.tf)
- Creates an Application Load Balancer with `target groups`, a `security group`, and a `listener` to handle incoming traffic.
