provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARP5PLQ5KKBZTVSG7"
  secret_key = "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"
}

resource "aws_iam_user" "lb" {
  name = "iamuser001"
  path = "/system/"
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}