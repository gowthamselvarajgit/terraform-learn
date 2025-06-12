provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH from 0.0.0.0/0"

    ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        description = "Allow SSH"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_instance" "example_ec2"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
      Name = "SSH-Instance"
    }
}