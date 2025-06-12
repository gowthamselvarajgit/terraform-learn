output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.nginx_instance.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value = aws_instance.nginx_instance.id
}

output "nginx_url" {
  description = "URL to access Nginx in browser"
  value = "http://${aws_instance.nginx_instance.public_ip}"
}