output "ec2_id" {
  value = aws_instance.web.id
}

output "subnet_id" {
  value = data.aws_subnet.selected.id
}