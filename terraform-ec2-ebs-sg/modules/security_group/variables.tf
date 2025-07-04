variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "ingress_from_port" {
  description = "value of the starting port for ingress rules"
  type        = number
}

variable "ingress_to_port" {
  description = "value of the ending port for ingress rules"
  type        = number
}

variable "egress_from_port" {
  description = "value of the starting port for egress rules"
  type        = number  
}

variable "egress_to_port" {
  description = "value of the ending port for egress rules"
  type        = number    
}

variable "ingress_protocol" {
  description = "Protocol for ingress rules"
  type        = string
}

variable "egress_protocol" {
  description = "Protocol for egress rules"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress rules"
  type        = list(string)
}

variable "egress_cidr_blocks" {
  description = "List of CIDR blocks for egress rules"
  type        = list(string)
}