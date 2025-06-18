data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}


data "aws_subnet" "first" {
    filter {
      name = "vpc-id"
      values = [data.aws_vpc.selected.id]
    }
}

resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-access-sg"
  }
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.first.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "existing-vpc-instance"
  }
}