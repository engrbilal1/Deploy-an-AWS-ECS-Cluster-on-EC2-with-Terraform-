## Infrastructure Setup Instructions
`To set up the infrastructure, follow these steps:`

#### Clone the repository:
`git clone https://github.com/engrbilal1/Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform-.git`
#### Navigate to the project directory:
`cd Deploy-an-AWS-ECS-Cluster-on-EC2-with-Terraform`
#### Initialize Terraform:
`terraform init`
#### Preview the changes:
`terraform plan`
#### Apply the changes:
`terraform apply --auto-approve`
## Deleting the Infrastructure
To delete the infrastructure, follow these steps:

Terminate instances manually through the AWS Management Console or CLI.

#### Run Terraform to destroy the resources:
`terraform destroy`

## Overview
##### The infrastructure includes the following components:

`Virtual Private Cloud (VPC) with 2 public subnets spread across 2 availability zones.`
`Elastic Container Service (ECS) cluster using container instances (EC2 launch type).`
`Application Load Balancer (ALB) to distribute traffic to ECS container instances.`
## Details
#### ECS Cluster Setup (ecs.tf)
Creates a cluster of container instances named ecs-cluster.
Defines a capacity provider, which is an Auto Scaling group for EC2 instances. Managed scaling is enabled, with a target capacity of 85%. This ensures efficient utilization of EC2 instances.
#### Defines a task definition named web-family with a volume and container definition specified in container-def.json.
Sets up a service named ecs-service with a desired count of 2 tasks. The REPLICA scheduler strategy is used, and an Application Load Balancer is attached to distribute traffic among tasks. The binpack task placement strategy is applied to optimize resource usage.
#### Auto Scaling Group Setup (asg.tf)
Creates a launch configuration, key pair, security groups for EC2 instances, and an Auto Scaling group.
`For key-pair you should run `ssh-keygen` in your local env and then copy your `id_rsa.pub` to current dir.`
`Enables ECS managed scaling by setting protect_from_scale_in to true in the Auto Scaling group configuration.`
#### IAM Setup (iam.tf)
`Creates roles to associate EC2 instances with clusters and perform other necessary tasks.`
#### Application Load Balancer Setup (alb.tf)
`Creates an Application Load Balancer with target groups, a security group, and a listener to handle incoming traffic.`
