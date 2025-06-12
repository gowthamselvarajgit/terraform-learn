provider "aws" {
  region = var.region
}

resource "aws_instance" "private_ip_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = "PrivateIPCheckInstance"
  }
}