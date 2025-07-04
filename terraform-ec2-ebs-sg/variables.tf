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

variable "instance_name" {
  description = "Name of the EC2 instance"
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
variable "ebs_name" {
  description = "Name of the ebs"
  type = string
}

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

// Security Group
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}
variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}
variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress rules"
  type        = list(string)
}
variable "ingress_protocol" {
  description = "Protocol for ingress rules"
  type        = string
}
variable "ingress_from_port" {
  description = "Starting port for ingress rules"
  type        = number
}
variable "ingress_to_port" {
  description = "Ending port for ingress rules"
  type        = number
}
variable "egress_cidr_blocks" {
  description = "List of CIDR blocks for egress rules"
  type        = list(string)
}
variable "egress_protocol" {
  description = "Protocol for egress rules"
  type        = string
}
variable "egress_from_port" {
  description = "Starting port for egress rules"
  type        = number
}
variable "egress_to_port" {
  description = "Ending port for egress rules"
  type        = number
}

