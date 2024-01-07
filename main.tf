# main.tf

resource "aws_s3_bucket" "dreamtech-technologies-test" {
  bucket = "dreamtech-technologies-test"
  acl    = "private"

  tags = {
    Name        = "dreamtech-technologies-test"
    Environment = "Production"
  }
}

