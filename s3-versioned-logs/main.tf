provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "app-log-storage-${var.owner_name}"

  tags = {
    Environment = var.environment
    Owner = var.owner_name
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.log_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}