provider "aws" {
  region = var.region
}

#vpc and subnet
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "${var.region}b"
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_rta1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

#nat gateway

#elastic ip
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public1.id
}

#private route table with nat
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

#security group

resource "aws_security_group" "web-sg" {
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
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ec2 in public subnet

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  user_data = (<<-EOF
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    echo "<h1>Web Server in Public Subnet</h1>" > /var/www/html/index.html
  EOF
  )

  tags = {
    Name = "Public-EC2"
  }
}