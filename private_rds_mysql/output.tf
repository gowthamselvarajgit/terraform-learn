output "rds_endpoint" {
  value = aws_db_instance.tfdb.endpoint
  description = "MySql rds endpoint"
}