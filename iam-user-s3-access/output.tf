output "access_key_id" {
  description = "Access key ID for gowtham-user"
  value = aws_iam_access_key.gowtham_user_key.id
  sensitive = true
}

output "secret_access_key" {
  description = "Secret Access Key for gowtham-user"
  value = aws_iam_access_key.gowtham_user_key.secret
  sensitive = true
}