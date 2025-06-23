provider "aws" {
  region = var.region
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
  key_name      = var.key_name
}
