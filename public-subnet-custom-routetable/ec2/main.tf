resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "public_ec2"
  }
}