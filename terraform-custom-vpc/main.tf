provider "aws" {
  region = var.region
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "CustomVPC"
  }
}

resource "aws_subnet" "custom_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone

  tags = {
    Name = "CustomSubnet"
  }
}

resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "CustomIGW"
  }
}

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }

  tags = {
    Name = "CustomRouteTable"
  }
}

resource "aws_route_table_association" "subnet_assoc" {
  subnet_id = aws_subnet.custom_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}

resource "aws_security_group" "web_sg" {
  name = "web-sg"
  description = "Allow HTTP and SSH"
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "WebSG"
  }
}

resource "aws_instance" "web_server" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.custom_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name = var.key_name

  tags = {
    Name = "WebServer"
  }
}
