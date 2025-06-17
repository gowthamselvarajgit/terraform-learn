locals {
  subnets = [
    cidrsubnet(var.vpc_cidr_block, 2, 0),
    cidrsubnet(var.vpc_cidr_block, 2, 1),
    cidrsubnet(var.vpc_cidr_block, 2, 2),
    cidrsubnet(var.vpc_cidr_block, 2, 3),
  ]

  fallback_value = try(lookup(var.optional_value, "key", "default_value"), "default_value")
}