output "public_ip" {
  value = aws_instance.web_server.public_ip
  description = "Public Ip of the Web Server"
}