terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
}

## if you want to store your terraform.tfstate file in s3 bucket then use this step other wise comments all these 
terraform {
   backend "s3" {
     bucket = "put_your_bucket_name"
     key    = "state/terraform.tfstate"
     region = "us-east-1"
   }
 }
