provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARP5PLQ5KHX4MREO2"
  secret_key = "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"
}

  #creating 5 user using count
  resource "aws_iam_user" "ks" { 
    count = 5
    name = "ks${count.index}"
    path = "/system/"
  
    tags = {
      tag-key = "misc"
    }
  }