variable "vpc_cidr_block" {
  description = "Base VPC CIDR block"
  type = string
}

variable "optional_value" {
  description = "Optional map input"
  type = any
  default = null
}