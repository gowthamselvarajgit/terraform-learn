module "ec2_ssh_dynamic" {
  source = "./modules/ec2_ssh_dynamic"
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}