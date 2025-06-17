output "ec2_instance_private_ip" {
  value = aws_instance.this.private_ip
}