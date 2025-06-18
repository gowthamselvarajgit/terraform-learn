output "instance_id" {
  value = aws_instance.this.id
}

output "volume_size" {
  value = var.env == "prod" ? 30 : 10
}