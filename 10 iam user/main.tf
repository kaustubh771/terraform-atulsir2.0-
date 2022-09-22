provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARP5PLQ5KKBZTVSG7"
  secret_key = "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"
}

  #creating 5 user using count
  resource "aws_iam_user" "us" { 
    count = 5
    name = "ks${count.index}"
    path = "/system/"
  
    tags = {
      tag-key = "misc"
    }
  }