output "vpc_id" {
  value = module.ec2.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "subnet_id" {
  value = module.ec2.subnet_id
}