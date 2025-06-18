output "ec2_instance" {
  value = module.ec2_instance.ec2_id
}

output "subnet_id" {
  value = module.ec2_instance.subnet_id
}