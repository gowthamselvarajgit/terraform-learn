provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./module"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  instance_list = var.instance_list
}