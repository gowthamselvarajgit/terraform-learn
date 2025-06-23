variable "ami" {
  type        = string
  default     = ""
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "The type of instance to start"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "The name of the key pair to use for SSH access"
}

variable "instance_name" {
  type        = string
  default     = ""
  description = "The name of the EC2 instance"
}
