provider "aws" {
  region = var.region
}

resource "aws_security_group" "nginx_sg" {
  name = "nginx_sg"
  description = "Allow SSH and HTTP access"

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

resource "aws_instance" "nginx_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.nginx_sg.id ]

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update -y",
        "sudo apt install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
     ]

     connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file(var.private_key_path)
       host = self.public_ip
     }
  }
  tags = {
    Name = "NginxProvisionedInstance"
  }
}

