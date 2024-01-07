resource "aws_s3_bucket" "dreamtech_technologies_test" {
  bucket = "dreamtech-technologies-test"

  # Other bucket configuration settings like tags, encryption, etc.

  block_public_acls   = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}
