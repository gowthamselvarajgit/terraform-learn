provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./module/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = "NAT-VPC"
}

module "public_subnet" {
  source = "./module/subnet"
  subnet_cidr_block = var.public_subnet_cidr
  az = var.az
  vpc_id = module.vpc.vpc_id
  subnet_name = var.public_subnet_name
  map_public_ip = var.map_public_ip_public
}

module "private_subnet" {
  source = "./module/subnet"
  subnet_cidr_block = var.private_subnet_cidr
  az = var.az
  vpc_id = module.vpc.vpc_id
  subnet_name = var.private_subnet_name
  map_public_ip = var.map_public_ip_private
}

module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
}

module "public_rt" {
  source = "./module/route_table"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.public_subnet.Subnet_id
  type = "igw"
  igw_id = module.igw.igw_id
}

module "private_rt" {
  source = "./module/route_table"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.private_subnet.Subnet_id
  type = "empty"
}

module "nat" {
  source = "./module/nat"
  public_subnet_id = module.public_subnet.Subnet_id
  private_route_table_id = module.private_rt.route_table_id
}

module "ec2_public" {
  source = "./module/ec2"
  subnet_id = module.public_subnet.Subnet_id
  ami = var.ami
  instance_type = var.instance_type
  instance_name = "Public-EC2"
  key_name = var.key_name
}

module "ec2_private" {
  source = "./module/ec2"
  subnet_id = module.private_subnet.Subnet_id
  ami = var.ami
  instance_type = var.instance_type
  instance_name = "Private-EC2"
  key_name = var.key_name
  }