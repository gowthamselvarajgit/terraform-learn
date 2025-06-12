provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "team_instance" {
  ami = var.ami
  instance_type = local.instance_type_map[terraform.workspace]
  key_name = var.key_name
  

  tags = {
    Name = "Workspace-${terraform.workspace}"
    Project = terraform.workspace
  }
}