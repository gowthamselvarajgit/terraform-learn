resource "aws_instance" "web" {
  count = length(var.instance_list)
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id

  tags = {
    Name = var.instance_list[count.index]
  }
}