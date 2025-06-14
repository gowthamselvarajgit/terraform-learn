variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "ami" {
  description = "Ubuntu AMI for ap-south-1"
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ec2"
}

