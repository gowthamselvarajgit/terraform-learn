variable "db_username" {
    description = "RDS master username"
    default = "admin"
}

variable "db_password" {
    description = "RDS master Password"
    type = string
    sensitive = true
}

variable "region" {
    description = "Region"
    type = string
    default = "ap-south-1"
}

variable "availability_zone_1" {
  description = "Availability zone 1"
  type = string
  default = "ap-south-1a"
}

variable "availability_zone_2" {
  description = "Availability zone 2"
  type = string
  default = "ap-south-1b"
}