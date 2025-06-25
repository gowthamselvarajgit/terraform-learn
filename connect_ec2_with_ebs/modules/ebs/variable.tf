variable "availability_zone" {
  description = "The availability zone to launch the EC2 instance in."
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

variable "instance_id" {
  description = "The ID of the EC2 instance to attach the EBS volume to."
  type        = string
  default     = ""

}
