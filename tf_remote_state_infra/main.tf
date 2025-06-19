module "s3_backend" {
  source = "./modules/s3_backend"
  s3_bucket_name = var.s3_bucket_name
}

module "dynamodb_lock" {
  source = "./modules/dynamodb_lock"
  table_name = var.dynamodb_table_name
}