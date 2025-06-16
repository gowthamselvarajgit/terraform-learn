output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet1_id" {
  value = module.vpc.subnet1_id
}

output "subnet2_id" {
  value = module.vpc.subnet2_id
}

output "route_table_id" {
  value = module.route_table.route_table_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "ec2_public_ips" {
  value = module.ec2.public_ips
}