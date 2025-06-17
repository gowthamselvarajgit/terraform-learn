variable "vpc_cidr_block" {
  description = "Base VPC cidr"
  type = string
  default = "10.0.0.0/16"
}

variable "optional_value" {
  description = "Optional map input"
  type = any
  default = null
}