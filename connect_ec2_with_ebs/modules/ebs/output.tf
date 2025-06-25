output "ebs_volume_id" {
  description = "value of the EBS volume ID"
  value       = aws_ebs_volume.extra_volume.id
}