provider "aws" {
  region = "ap-south-1"
}

locals {
  instance_type_map = {
    developer = "t2.micro"
    tester = "t2.small"
    admin = "t2.medium"
  }
}

resource "aws_instance" "role_based_ec2" {
  ami = var.ami
  instance_type = local.instance_type_map[terraform.workspace]
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true

  tags = {
    Name = "Role-Based-Instance-${terraform.workspace}"
  }
}

output "current_workspace" {
  value = terraform.workspace
}

output "instance_type_for_workspace" {
  value = local.instance_type_map[terraform.workspace]
}