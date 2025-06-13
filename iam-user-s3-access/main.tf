provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "gowtham_user" {
  name = "gowtham-user"
  tags = {
    Owner = var.owner
  }
}

resource "aws_iam_user_policy_attachment" "s3_access" {
  user = aws_iam_user.gowtham_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_access_key" "gowtham_user_key" {
  user = aws_iam_user.gowtham_user.name
}