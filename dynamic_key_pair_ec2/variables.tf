variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}