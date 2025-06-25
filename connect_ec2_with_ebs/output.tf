output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "ebs_volume_id" {
  description = "ID of the EBS volume"
  value       = module.ebs.ebs_volume_id
}
