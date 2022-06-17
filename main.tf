resource "aws_s3_bucket" "b" {
  bucket = "pravin-learning-uat"

  tags = {
    Name        = "My bucket"
    Environment = "prod2404"
  }
}