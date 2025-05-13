data "aws_caller_identity" "current" {}

locals {
  environment = terraform.workspace
  bucket_name = "${var.namespace}-${local.environment}-${replace(var.region, "-", "")}-${var.project_name}-${data.aws_caller_identity.current.account_id}"
}

module "s3_bucket" {
  # checkov:skip=CKV_TF_1 Ensure Terraform module sources use a commit hash.
  # checkov:skip=CKV_TF_2 Ensure Terraform module sources use a tag with a version number.
  source = "git::https://@github.com/rmurillo21/terraform-modules.git//modules/aws/s3?ref=develop"

  bucket        = local.bucket_name
  acl           = var.acl_type
  force_destroy = var.force_destroy
  versioning = {
    enabled = var.buacket_versioning
  }

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership

  website = var.website

  tags = merge(tomap({ "Name" = local.bucket_name }), var.tags)
}