module "ec2_launcher" {
  source = "./modules/ec2_launcher"
  ami_id = var.ami_id
  instance_type = var.instance_type
  vpc_id = var.vpc_id
  sg_id = var.sg_id
  subnet_id = var.subnet_id
}