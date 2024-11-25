terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "devops-eks-cluster"
    region         = "us-east-2"
    key            = "devops-eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}