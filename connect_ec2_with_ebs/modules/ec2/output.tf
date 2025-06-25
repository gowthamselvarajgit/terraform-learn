output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my_ec2_instance.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
}


output "availability_zone" {
  description = "Availability Zone of the EC2 instance"
  value       = aws_instance.my_ec2_instance.availability_zone
}
