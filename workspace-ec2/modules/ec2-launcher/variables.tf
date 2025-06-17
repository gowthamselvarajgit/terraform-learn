variable "ami_id" {
  type = string
}

variable "instance_type" {
  
}

variable "subnet_id" {
  
}

variable "security_group_ids" {
  type = list(string)  
}

variable "workspace" {
  type = string
}

