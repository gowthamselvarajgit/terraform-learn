resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "multi-az-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet1_cidr_block
  availability_zone = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet2_cidr_block
  availability_zone = var.az2
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}