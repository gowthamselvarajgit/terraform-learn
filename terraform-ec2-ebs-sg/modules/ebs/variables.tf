variable "availability_zone" {
  description = "Availability zone for the resources"
  type        = string
}

variable "size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
}

variable "name" {
  description = "Name of the EBS volume"
  type        = string
}

variable "device_name" {
  description = "Device name for the EBS volume"
  type        = string
}

variable "instance_id" {
  description = "ID of the EC2 instance to attach the EBS volume to"
  type        = string
}
