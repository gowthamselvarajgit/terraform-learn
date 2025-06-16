output "public_ec2_private_ip" {
  value = module.ec2_public.ec2_private-ip
}

output "private_ec2_private_ip" {
  value = module.ec2_private.ec2_private-ip
}

output "igw_id" {
  value = module.igw.igw_id
}

output "nat_id" {
  value = module.nat.nat_gateway_id
}

output "public_route_table_id" {
  value = module.public_rt.route_table_id
}

output "private_route_table_id" {
  value = module.private_rt.route_table_id
}

output "public_subnet_id" {
  value = module.public_subnet.Subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.Subnet_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}