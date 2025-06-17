data "aws_vpc" "selected" {
    id = var.vpc_id 
}

data "aws_subnet" "subnets" {
    vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "selected" {
    id = var.sg_id
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.subnets.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name = "ec2-from-existing"
  }
}