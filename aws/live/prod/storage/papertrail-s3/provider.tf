# provider.tf
provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.terraform_role
  }

  default_tags {
    tags = {
      Terraform   = true
      Namespace   = var.namespace
      Owner       = var.owner
      Environment = local.environment
    }
  }
}

terraform {
  required_version = ">= 1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.74"
    }
  }
}
