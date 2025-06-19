output "lock_table_name" {
  value = module.dynamodb_lock.lock_table_name
}

output "bucket_id" {
  value = module.s3_backend.bucket_id
}