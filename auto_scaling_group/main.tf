provider "aws" {
  region = var.region
}

// VPC, Subnet Creation with igw and rt
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_1
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_2
  availability_zone = "ap-south-1b"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "default" {
  route_table_id = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "a1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "a2" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}

//Seurity Group
resource "aws_security_group" "web_sg" {
  name = "web-sg"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
}
