output "ebs_volume_id" {
  value       = aws_ebs_volume.this.id
  description = "ID of the EBS volume"
}
