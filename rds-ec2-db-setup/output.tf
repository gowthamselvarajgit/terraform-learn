output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
    value = module.vpc.private_subnet_ids
}

output "ec2_public_ip" {
    value = module.ec2.ec2_public_ip
}

output "rds_endpoint" {
    value = module.rds.rds_endpoint
}

output "rds_port" {
    value = module.rds.rds_port
}