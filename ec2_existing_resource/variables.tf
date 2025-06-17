variable "vpc_id" {
  description = "The existing VPC id"
  type = string
}

variable "subnet_id" {
  description = "The existing Subnet id"
  type = string
}

variable "sg_id" {
  description = "The existing Security Group id"
}

variable "ami_id" {
  description = "Ami ID"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}