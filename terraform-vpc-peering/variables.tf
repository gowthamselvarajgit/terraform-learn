variable "region" {
  default = "ap-south-1"
}

variable "vpc_a_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_b_cidr" {
  default = "10.1.0.0/16"
}

variable "subnet_a_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  default = "10.1.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0f918f7e67a3323f0"
}

variable "key_name" {
  default = "ec2"
}