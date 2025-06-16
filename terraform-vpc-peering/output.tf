output "ec2_a_private_ip" {
  value = module.ec2_a.private_ip
}

output "ec2_b_private_ip" {
  value = module.ec2_b.private_ip
}

output "vpc_a_id" {
  value = module.vpc-a.vpc_id
}

output "vpc_b_id" {
  value = module.vpc-b.vpc_id
}

output "subnet_a_id" {
  value = module.vpc-a.subnet_id
}

output "subnet_b_id" {
  value = module.vpc-b.subnet_id
}

output "vpc_peering_connection_id" {
  value = module.vpc_peering.vpc_peering_connection_id
}