resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.env == "prod" ? 30 : 10
    volume_type = "gp2"
  }

  tags = {
    Name = "EC2-${var.env}"
  }
}