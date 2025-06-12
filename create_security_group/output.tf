output "instance_public_ip" {
  value = aws_instance.example_ec2.public_ip
}