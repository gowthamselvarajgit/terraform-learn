variable "ami" {
  description = "AMI ID for EC2 instances"
  type = string
  default = "ami-02521d90e7410d9f0"
}

variable "key_name" {
  description = "key pair name"
  type = string
  default = "ec2"
}

variable "subnet_id" {
  description = "Subnet ID"
  type = string
  default = "subnet-03cb248b6bfea8a3f"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type = list(string)
  default = [ "sg-002dbcde6774358c6" ]
}