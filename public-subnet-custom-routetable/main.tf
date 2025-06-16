provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "igw" {
  source = "./igw"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  public_subnet_id = module.vpc.public_subnet_id
}

module "ec2" {
  source = "./ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = module.vpc.public_subnet_id
}