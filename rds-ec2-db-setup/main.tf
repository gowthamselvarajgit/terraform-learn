provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_cidrs   = var.public_subnet_cidrs
  private_cidrs  = var.private_subnet_cidrs
}

module "rds" {
  source             = "./modules/rds"
  allocated_storage  = var.allocated_storage
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  user_name          = var.user_name
  password           = var.db_password
  ec2_sg_id          = module.ec2.ec2_sg_id
  vpc_id             = module.vpc.vpc_id
  db_name            = var.db_name
  subnet_ids         = module.vpc.private_subnet_ids
}

module "ec2" {
  source         = "./modules/ec2"
  ami            = var.ami
  instance_type = var.instance_type
  subnet_id      = module.vpc.public_subnet_id[0]
  rds_endpoint   = module.rds.rds_endpoint
  rds_port       = module.rds.rds_port
  ssh_ingress_ip = var.ssh_ingress_ip
  vpc_id         = module.vpc.vpc_id
  db_password    = var.db_password
}
