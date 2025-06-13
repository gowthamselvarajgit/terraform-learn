
resource "aws_security_group" "web-sg" {
  name = "web-server-sg"
  description = "Allow ssh and http access"


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

  tags = {
    Name = "WebSecurityGroup"
  }
}

resource "aws_instance" "web_server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  
  tags = {
    Name = "WebServer"
  }
}

