provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "imported_ec2" {
  ami = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
}