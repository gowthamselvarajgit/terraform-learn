provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  env = var.env
}