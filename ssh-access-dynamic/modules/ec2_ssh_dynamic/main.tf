data "http" "my_ip" {
  url = "http://api.ipify.org"
}

locals {
  my_ip_cidr = "${trimspace(data.http.my_ip.response_body)}/32"
}

resource "aws_security_group" "ssh-sg" {
  name = "ssh-for-dynamic-ip"
  description = "Allow ssh only from my dynamic IP"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [local.my_ip_cidr]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ssh-sg.id]

  tags = {
    Name = "SSH-Dynamic-EC2"
  }
}