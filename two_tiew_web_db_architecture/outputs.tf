output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_server_private_ip" {
  value = aws_instance.web.private_ip
}