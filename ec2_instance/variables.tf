variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "The AWS region to deploy resources in"

}

variable "ami" {
  type        = string
  default     = ""
  description = "description"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "The type of instance to start"
}

variable "instance_name" {
  type        = string
  default     = ""
  description = "The name of the EC2 instance"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "The name of the key pair to use for SSH access"
}
