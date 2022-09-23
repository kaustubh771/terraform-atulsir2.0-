provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARP5PLQ5KMSRTG6CQ"
  secret_key = "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"
}

resource "aws_s3_bucket" "boeieh" {
  bucket = "kaustubh121212121"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

