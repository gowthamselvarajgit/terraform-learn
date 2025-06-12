output "current_workspace" {
  description = "The current Terraform workspace"
  value = terraform.workspace
}

output "ec2_instance_type" {
  description = "EC2 instance type for the current workspace"
  value = local.instance_type_map[terraform.workspace]
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.team_instance.id
}

output "ec2_instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.team_instance.public_ip
}