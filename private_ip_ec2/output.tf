output "private_ip" {
  description = "This is private ip of the instance"
  value = aws_instance.private_ip_instance.private_ip
}