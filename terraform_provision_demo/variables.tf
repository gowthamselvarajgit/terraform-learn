variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-02521d90e7410d9f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ec2"
}

variable "private_key_path" {
  default = "/home/gowtham/Downloads/key_pair/ec2.pem"
}