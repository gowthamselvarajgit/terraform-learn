variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.0.0/24"
}