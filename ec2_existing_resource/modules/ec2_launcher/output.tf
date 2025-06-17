output "instance_id" {
  value = aws_instance.web.id
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "sg-name" {
  value = data.aws_security_group.selected.name
}