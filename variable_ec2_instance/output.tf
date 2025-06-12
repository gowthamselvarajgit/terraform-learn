output "instance_id" {
  description = "The ID pf the EC2 instance"
  value = aws_instance.variable_ec2.id
}

output "public_id" {
  description = "The public IP address of the EC2 instance"
  value = aws_instance.variable_ec2.public_ip
}

output "instance_type" {
  description = "The instance type used"
  value = var.instance_type
}