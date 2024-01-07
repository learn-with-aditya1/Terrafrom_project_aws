resource "aws_s3_bucket" "dreamtech_technologies_test" {
  bucket = "dreamtech-technologies-test"

  # Other bucket configuration settings like tags, encryption, etc.
}

resource "aws_s3_bucket_public_access_block" "dreamtech_technologies_test_access_block" {
  bucket = aws_s3_bucket.dreamtech_technologies_test.id

  block_public_acls   = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}
