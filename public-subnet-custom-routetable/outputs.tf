output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.public_subnet_id
}

output "internet_gateway_id" {
  value = module.igw.igw_id
}

output "route_table_id" {
  value = module.route_table.route_table_id
}

output "ec2_instnace_public_ip" {
  value = module.ec2.public_ip
}