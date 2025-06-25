variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "value of the instance type to launch."
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access."
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
  default     = ""
}
