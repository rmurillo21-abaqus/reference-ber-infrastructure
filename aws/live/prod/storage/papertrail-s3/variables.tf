variable "owner" {
  type        = string
  description = "(Required) The name or identifier of the person, team, or entity responsible for the resource. This value is typically used as a tag (e.g., `Owner`) to help identify ownership and facilitate resource management and cost tracking."
}

variable "region" {
  description = "(Required) AWS region"
  type        = string
}

variable "namespace" {
  type        = string
  description = "(Required) A unique identifierused to logically group and organize AWS resources."
}

variable "project_name" {
  type        = string
  description = "(Required) The name of the project or application. This value is used as a prefix for naming all resources created by this module, ensuring consistent and identifiable resource naming across the infrastructure."
}

variable "force_destroy" {
  type        = bool
  description = "(Required) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "buacket_versioning" {
  type        = bool
  description = "(Required) buacket versioning true/false"
}

variable "object_ownership" {
  description = "(Optional) Object ownership. Valid values: BucketOwnerEnforced, BucketOwnerPreferred or ObjectWriter. 'BucketOwnerEnforced': ACLs are disabled, and the bucket owner automatically owns and has full control over every object in the bucket. 'BucketOwnerPreferred': Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL. 'ObjectWriter': The uploading account will own the object if the object is uploaded with the bucket-owner-full-control canned ACL."
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "control_object_ownership" {
  description = "(Optional) Whether to manage S3 Bucket Ownership Controls on this bucket."
  type        = bool
  default     = false
}

variable "block_public_acls" {
  description = "(Optional) Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "(Optional) Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "(Optional) Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "(Optional) Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "acl_type" {
  type        = string
  description = "(Required) The canned ACL to apply. Conflicts with `grant"
}

variable "website" {
  description = "(Optional) Map containing static web-site hosting or redirect configuration."
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to each resource"
  default     = {}
}

variable "terraform_role" {
  description = "(Required) ARN of the IAM role to assume when creating the resources in the primary account"
  type        = string
}