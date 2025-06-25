provider "aws" {
  region = var.region
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  instance_name = var.instance_name
}

module "ebs" {
  source            = "./modules/ebs"
  availability_zone = module.ec2.availability_zone
  volume_size       = var.volume_size
  volume_name       = var.volume_name
  device_name       = var.device_name
  volume_type       = var.volume_type
  instance_id       = module.ec2.instance_id
}
