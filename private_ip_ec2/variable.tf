variable "region" {
  description = "The region of EC2"
  type = string
  default = "ap-south-1"
}

variable "ami" {
  description = "EC2 AMI"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 key pair"
  type = string
  default = "ec2"
}