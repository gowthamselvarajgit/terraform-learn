output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value = aws_s3_bucket.log_bucket.id
}

output "versioning_status" {
  description = "Versioning status of the bucket"
  value = aws_s3_bucket_versioning.versioning.versioning_configuration[0].status
}