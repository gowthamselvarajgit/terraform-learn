variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "ap-south-1"
}

variable "owner_name" {
  description = "Name of the bucket owner"
  type = string
  default = "gowtham"
}

variable "environment" {
  description = "Environment name"
  type = string
  default = "Dev"
}