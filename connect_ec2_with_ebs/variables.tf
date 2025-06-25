variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
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

variable "volume_size" {
  description = "The size of the EBS volume in GB."
  type        = number
}

variable "volume_name" {
  description = "The name of the EBS volume."
  type        = string
  default     = ""
}

variable "device_name" {
  description = "The device name for the EBS volume."
  type        = string
  default     = ""
}

variable "volume_type" {
  description = "The type of EBS volume."
  type        = string
  default     = ""
}
