provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARP5PLQ5KKBZTVSG7"
  secret_key = "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"
}

resource "aws_s3_bucket" "c" {
  count=15
  bucket = "bucket070912${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

