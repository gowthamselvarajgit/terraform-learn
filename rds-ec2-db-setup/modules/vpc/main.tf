resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_cidrs[count.index]
  availability_zone = element(["ap-south-1a", "ap-south-1b"], count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "default" {
  route_table_id = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  count = length(var.public_cidrs)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}