#provider.tf is to declare which cloud provider we are using to automate the cloud resources.

#we will be using AWS cloud in this provider

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  region = var.aws_region
  secret_key = var.aws_secret_key
}
