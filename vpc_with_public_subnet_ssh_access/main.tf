resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "public-vpc"
  }
}

#subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}

#route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

#associate route table with subnet
resource "aws_route_table_association" "public_rta" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

#security group for ssh
resource "aws_security_group" "ssh_sg" {
  name = "ssh-access"
  description = "Allow SSH"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"
  }
}

#EC2 Instance
resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "Public-EC2"
  }
}