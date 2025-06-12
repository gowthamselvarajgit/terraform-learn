variable "ami" {
  description = "AMI ALLOCATION"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}