variable "region" {
  description = "AWS region to deploy resources"
  type = string
  default = "ap-south-1"
}

variable "bucket_name" {
  description = "AWS S3 Bucket name for hosting static hosting"
  type = string
  default = "gowtham-portfolio-site-bucket"
}