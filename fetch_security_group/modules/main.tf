data "aws_security_group" "shared" {
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [data.aws_security_group.shared.id]

  tags = {
    Name = "Web-From-Shared-SG"
  }
}