provider "aws" {
  region = var.region
}

data "aws_key_pair" "existing" {
  key_name = var.key_pair_name
}

module "ec2_instance" {
  source = "./modules/ec2_instances"
  ami = var.ami
  instance_type = var.instance_type
  key_name = data.aws_key_pair.existing.key_name
  subnet_id = var.subnet_id
}