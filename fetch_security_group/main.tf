provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  sg_name       = var.sg_name
  vpc_id        = var.vpc_id
}