resource "aws_db_subnet_group" "this" {
  name = "rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "rds-subnet-group"
  } 
}

resource "aws_security_group" "rds_sg" {
  name = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [ var.ec2_sg_id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-access"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  db_name = var.db_name
  username = var.user_name
  password = var.password
  skip_final_snapshot = true
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "my-rds"
  }
}