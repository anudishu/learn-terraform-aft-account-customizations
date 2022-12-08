data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-production-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}


resource "aws_s3_account_public_access_block" "s3_block" {
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}


