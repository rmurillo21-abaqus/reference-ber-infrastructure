# status backend from terraform in terraform.io
# Backend
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "GreenMarimba"
    workspaces {
      prefix = "gm-s3-papertrail-"
    }
  }

  required_version = ">= 1.2.2"
}