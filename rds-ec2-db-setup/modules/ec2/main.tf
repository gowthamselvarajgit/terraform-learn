resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_ingress_ip]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-access"
  }
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = (
    <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y mysql-client
    echo "Attempting DB Connection"
    mysql -h ${var.rds_endpoint} -P ${var.rds_port} -u admin -p${var.db_password} -e "SHOW DATABASES;"
    EOF
  )

  tags = {
    Name = "web-ec2"
  }
}