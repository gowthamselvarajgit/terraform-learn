resource "aws_instance" "web" {
  count = length(var.subnet_ids)
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_ids[count.index]
  associate_public_ip_address = true

  tags = {
    Name = "web-${count.index + 1}"
  }
}