output "instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}

output "ebs_volume_id" {
  value = module.ebs.ebs_volume_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
