resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "rds-vpc"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_1
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.availability_zone_2
  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_db_subnet_group" "tfdb_subnet_group" {
  name = "tfdb-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

resource "aws_security_group" "tfdb_sg" {
  name = "tfdb-sg"
  description = "Allow MySQL traffic internally"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tfdb-sg"
  }
}

resource "aws_db_instance" "tfdb" {
  identifier = "tfdb-instance"
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  db_name = "tfdb"
  username = var.db_username
  password = var.db_password
  db_subnet_group_name = aws_db_subnet_group.tfdb_subnet_group.name
  vpc_security_group_ids = [aws_security_group.tfdb_sg.id]
  publicly_accessible = false
  skip_final_snapshot = true
  storage_encrypted = true
  multi_az = false

  tags = {
    Name = "tfdb"
  }
}