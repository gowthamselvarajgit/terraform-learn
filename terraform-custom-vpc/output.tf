output "vpc_id" {
  description = "VPC Id"
  value = aws_vpc.custom_vpc.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR Block"
  value = aws_vpc.custom_vpc.cidr_block
}

output "subnet_id" {
  description = "Subnet Id"
  value = aws_subnet.custom_subnet.id
}

output "subnet_cidr_block" {
  description = "Subnet CIDR Block"
  value = aws_subnet.custom_subnet.cidr_block
}

output "public_ip" {
  description = "Public IP of the Web Server"
  value = aws_instance.web_server.public_ip
}