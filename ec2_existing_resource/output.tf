output "instance_id" {
  value = module.ec2_launcher.instance_id
}

output "used_vpc_id" {
  value = module.ec2_launcher.vpc_id
}

output "used_sg_name" {
  value = module.ec2_launcher.sg-name
}