provider "aws" {
  region = "ap-south-1"
}

module "ec2_launcher" {
  source = "./modules/ec2-launcher"
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  security_group_ids = [var.sg_id]
  workspace = terraform.workspace
}