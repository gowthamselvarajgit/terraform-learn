output "created_iam_users" {
  value = aws_iam_user.dev_users[*].name
}