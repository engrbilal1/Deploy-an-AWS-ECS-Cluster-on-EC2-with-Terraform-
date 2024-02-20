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
  #shared_credentials_file = "$HOME/.aws/credentials" # default
  #profile = "default" # you may change to desired profile
  #version = "~> 5.0"
}


# terraform {
#   backend "s3" {
#     bucket = "ecsworkshopbucket00"
#     key    = "state/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
