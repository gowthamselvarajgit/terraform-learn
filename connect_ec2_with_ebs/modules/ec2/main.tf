resource "aws_instance" "my_ec2_instance" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name

  tags = {
    Name = var.instance_name
  }
}
