terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
  #informing terraform to check state remotely by providing below block in provider.tf file 
    backend "s3" {
    bucket         = "ven-remote-state"
    key            = "remote-state-demo"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}