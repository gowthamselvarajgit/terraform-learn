variable "region" {
  description = "AWS region"
  type = string
  default = "ap-south-1"
}

variable "ami" {
  description = "EC2 AMI"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type = string
  default = "ec2"
}
