provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "static_site" {
    bucket = var.bucket_name
    force_destroy = true

    tags = {
      Name = "StaticSiteBucket"
    }
}

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.static_site.id
    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"
    }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.static_site.id

    block_public_acls = false
    block_public_policy = false 
    ignore_public_acls = false 
    restrict_public_buckets = false 
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.static_site.id
    key = "index.html"
    source = "${path.module}/index.html"
    content_type =  "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.static_site.id
  key = "error.html"
  source = "${path.module}/error.html"
  content_type = "text/html"
}