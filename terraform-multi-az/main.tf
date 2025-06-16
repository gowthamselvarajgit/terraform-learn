module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
  subnet1_cidr_block = var.subnet1_cidr
  subnet2_cidr_block = var.subnet2_cidr
  az1 = var.az1
  az2 = var.az2
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  subnet_ids = {
  subnet1 = module.vpc.subnet1_id,
  subnet2 = module.vpc.subnet2_id
  }
}

module "ec2" {
  source = "./modules/ec2"
  subnet_ids = [ module.vpc.subnet1_id, module.vpc.subnet2_id ]
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}