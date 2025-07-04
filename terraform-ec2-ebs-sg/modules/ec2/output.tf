output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "availability_zone" {
  description = "Availability zone of the EC2 instance"
  value       = aws_instance.this.availability_zone
}

output "public_ip" {
  description = "Public IP of the EC2 Instance"
  value       = aws_instance.this.public_ip
}
