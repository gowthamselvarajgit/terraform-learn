locals {
  mismatch_error = var.number_of_users != length(var.user_name)
}

resource "aws_iam_user" "dev_users" {
  count = var.number_of_users
  name = var.user_name[count.index]

  tags = {
    ROle = "Developer"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_user_policy_attachment" "ec2_readonly" {
  count = var.number_of_users
  user = aws_iam_user.dev_users[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}