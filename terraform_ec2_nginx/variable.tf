variable "region" {
  description = "AWS region to launch instance in"
  type = string
  default = "ap-south-1"
}

variable "ami" {
  description = "AMI for the EC2 instance"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type = string
  default = "ec2"
}

variable "private_key_path" {
  description = "Path to the private key (.pem file)"
  type = string
  default = "/home/gowtham/Downloads/key_pair/ec2.pem"
}