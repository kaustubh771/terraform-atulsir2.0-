provider "aws" {
  region     = "us-west-2"
  

resource "aws_s3_bucket" "c" {
  count=15
  bucket = "vinaybucket${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

