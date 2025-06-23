output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.public_ip
}
