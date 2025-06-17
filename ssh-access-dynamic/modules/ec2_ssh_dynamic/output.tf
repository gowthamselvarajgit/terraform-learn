output "allowed_ssh_ip" {
  value = local.my_ip_cidr
}

output "instance_id" {
  value = aws_instance.web.id
}

output "ec2_private_ip" {
  value = aws_instance.web.private_ip
}