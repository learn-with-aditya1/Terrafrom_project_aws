resource "aws_s3_bucket" "dreamtech_technologies_test" {
  bucket = "dreamtech-technologies-test"

  tags = {
    Name        = "DreamtechTechnologiesTestBucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_acl" "dreamtech_technologies_test_acl" {
  bucket = aws_s3_bucket.dreamtech_technologies_test.id

  # Specify the ACL here, for example:
  grant {
    permissions = "private"
  }
}
