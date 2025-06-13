variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type = string
  default = "ap-south-1a"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "ami" {
  description = "AMI for EC2 Instances"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "key_name" {
  description = "EC2 key pair name"
  type = string
  default = "ec2"
}