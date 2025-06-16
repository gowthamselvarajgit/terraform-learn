variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "az1" {
  default = "ap-south-1a"
}

variable "az2" {
  default = "ap-south-1b"
}

variable "ami" {
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ec2"
}