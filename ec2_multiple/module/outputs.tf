output "ec2_instances" {
  value = [for i in aws_instance.web : i.tags["Name"]]
}