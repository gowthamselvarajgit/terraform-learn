//Region
variable "region" {
  description = "value for the AWS region"
  type        = string
  default     = "ap-south-1"
}

// EC2
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}

//VPC & Subnet
variable "vpc_id" {
  description = "ID of the VPC where the EC2 instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
}


// EBS
variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "ebs_volume_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp2"
}

variable "device_name" {
  description = "Device name for the EBS volume"
  type        = string
}

