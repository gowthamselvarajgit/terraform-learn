output "instance_names" {
  description = "Name of the EC2 Instances"
  value = [ for i in aws_instance.web : i.tags["Name"] ]
}

output "instance_ids" {
  description = "IDs of the EC2 Instances"
  value = [ for i in aws_instance.web : i.id ]
}

output "private_ips" {
  description = "Private ip's of EC2 Instances"
  value = [ for i in aws_instance.web : i.private_ip ]
}