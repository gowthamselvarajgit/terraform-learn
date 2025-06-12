provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "variable_ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "ec2"

  tags = {
    Name = "InstanceWithVariableType"
  }
}