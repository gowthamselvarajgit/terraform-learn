module "subnet_generator" {
  source = "./modules/subnet_generator"
  vpc_cidr_block = var.vpc_cidr_block
  optional_value = var.optional_value
}