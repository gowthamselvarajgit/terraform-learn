output "allowed_ssh_ip" {
  value = module.ec2_ssh_dynamic.allowed_ssh_ip
}

output "instance_id" {
  value = module.ec2_ssh_dynamic.instance_id
}

output "ec2_private_ip" {
  value = module.ec2_ssh_dynamic.ec2_private_ip
}