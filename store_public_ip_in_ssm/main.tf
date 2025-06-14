provider "aws" {
  region = var.region
}

#VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  
  tags = {
    Name = "main_vpc"
  }
}

#Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

#Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

#security group
resource "aws_security_group" "web_sg" {
  name = "web-sg"
  vpc_id = aws_vpc.main_vpc.id

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
}

#ec2 instance

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Web-Server"
  }

}

#store public in in paramter store

resource "aws_ssm_parameter" "ec2_public_ip" {
  name = "/ec2/web/public_ip"
  type = "String"
  value = aws_instance.web.public_ip
  overwrite = true
}