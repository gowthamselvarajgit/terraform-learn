variable "region" {
  description = "The region we are going to work with"
  type = string
  default = "ap-south-1"
}

variable "ami" {
  description = "The EC2 AMI"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "key_name" {
  description = "The EC2 key pair name"
  type = string
  default = "ec2"
}

variable "instance_type" {
  description = "The EC2 Instance type"
  type = string
  default = "t2.micro"
}