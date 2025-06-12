variable "ami" {
    description = "AMI ID"
    type = string
    default = "ami-02521d90e7410d9f0"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "SSH Key Pair Name"
    type = string
    default = "ec2"
}