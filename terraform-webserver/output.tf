output "public_ip" {
  description = "The Public IP of the EC2 instance"
  value = aws_instance.web_server.public_ip
}