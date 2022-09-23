provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA6P5G53DUFKJ2EB5D"
  secret_key = "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"
}

resource "aws_s3_bucket" "b" {
  bucket = "mu1-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

