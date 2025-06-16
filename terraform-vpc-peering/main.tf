provider "aws" {
  region = var.region
}

module "vpc-a" {
  source = "./module/vpc"
  vpc_name = "VPC-A"
  vpc_cidr_block = var.vpc_a_cidr
  subnet_cidr_block = var.subnet_a_cidr
  az = "ap-south-1a"
}

module "vpc-b" {
  source = "./module/vpc"
  vpc_name = "VPC-B"
  vpc_cidr_block = var.vpc_b_cidr
  subnet_cidr_block = var.subnet_b_cidr
  az  = "ap-south-1b"
}

module "vpc_peering" {
  source = "./module/peering"
  vpc_id_a = module.vpc-a.vpc_id
  vpc_id_b = module.vpc-b.vpc_id
  cidr_a = var.vpc_a_cidr
  cidr_b = var.vpc_b_cidr
  subnet_a_id = module.vpc-a.subnet_id
  subnet_b_id = module.vpc-b.subnet_id
}

module "ec2_a" {
  source = "./module/ec2"
  ami = var.ami
  instance_name = "EC2-A"
  instance_type = var.instance_type
  subnet_id = module.vpc-a.subnet_id
  key_name = var.key_name
}

module "ec2_b" {
  source = "./module/ec2"
  instance_name = "EC2-B"
  instance_type = var.instance_type
  subnet_id = module.vpc-b.subnet_id
  ami = var.ami
  key_name = var.key_name
}