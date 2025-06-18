variable "region" {
  default     = "ap-south-1"
  description = "AWS region to deploy resources"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "ami" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ssh_ingress_ip" {
  description = "Your IP for SSH access (e.g., 203.0.113.10/32)"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Storage for the RDS instance in GB"
  type        = number
}

variable "engine" {
  description = "RDS engine (e.g., mysql)"
  type        = string
}

variable "engine_version" {
  description = "Version of RDS engine"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "user_name" {
  description = "Master username for RDS"
  type        = string
}
