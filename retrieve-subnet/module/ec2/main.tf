data "aws_subnet" "selected" {
  filter {
    name = "tag:${var.subnet_tag_key}"
    values = [var.subnet_tag_value]
  }
}

resource "aws_security_group" "this" {
  name = "security-sg"
  description = "Allow SSH"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  subnet_id = data.aws_subnet.selected.id
  vpc_security_group_ids = [aws_security_group.this.id]
  tags = {
    Name = "WebEC2"
  }
}