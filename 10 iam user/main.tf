provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAYCFU4RKBIITQK6N2"
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
