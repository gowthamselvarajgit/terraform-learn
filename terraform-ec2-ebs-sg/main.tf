provider "aws" {
  region = var.region
}

module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  instance_name          = var.instance_name
  vpc_security_group_ids = [module.sg.security_group_id]
}

module "sg" {
  source              = "./modules/security_group"
  name                = var.security_group_name
  description         = var.security_group_description
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_cidr_blocks  = var.egress_cidr_blocks
  ingress_protocol    = var.ingress_protocol
  egress_protocol     = var.egress_protocol
  ingress_from_port   = var.ingress_from_port
  ingress_to_port     = var.ingress_to_port
  egress_from_port    = var.egress_from_port
  egress_to_port      = var.egress_to_port
}

module "ebs" {
  source            = "./modules/ebs"
  availability_zone = module.ec2.availability_zone
  name              = var.ebs_name
  size              = var.ebs_volume_size
  device_name       = var.device_name
  volume_type       = var.ebs_volume_type
  instance_id       = module.ec2.instance_id
}
