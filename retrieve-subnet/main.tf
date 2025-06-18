provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source = "./module/ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_tag_key = var.subnet_tag_key
  subnet_tag_value = var.subnet_tag_value
}