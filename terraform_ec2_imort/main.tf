provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "imported_ec2" {
  ami = "ami-02521d90e7410d9f0"
  instance_type = "t2.micro"
  key_name = "ec2"
  subnet_id = "subnet-03cb248b6bfea8a3f"
  vpc_security_group_ids = ["sg-002dbcde6774358c6"]
  associate_public_ip_address = true

  tags = {
    Name = "Ubuntu-Web-Server"
  }
}