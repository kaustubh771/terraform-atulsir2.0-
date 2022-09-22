provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA6P5G53DUFKJ2EB5D"
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
