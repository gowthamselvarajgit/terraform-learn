output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "subnet_id" {
  value = aws_instance.web.subnet_id
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}