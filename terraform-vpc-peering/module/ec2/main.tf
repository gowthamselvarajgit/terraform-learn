resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name
  }
}