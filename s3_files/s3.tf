### Creating the S3 bucket ###

resource "aws_s3_bucket" "bucket" {
  bucket = "portfolio-aws-s3"
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowTrustEntity",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::617420245895:role/oidc-terraform-aws-s3-website-role"
        },
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::portfolio-aws-s3/*"
        ]
      },
      {
        "Sid": "AllowCloudFrontServicePrincipalReadOnly",
        "Effect": "Allow",
        "Principal": {
          "Service": "cloudfront.amazonaws.com"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::portfolio-aws-s3/*",
        "Condition": {
          "StringEquals": {
            "aws:SourceArn": "arn:aws:cloudfront::617420245895:distribution/${aws_cloudfront_distribution.s3_website.id}"
          }
        }
      }
    ]
  })
}


resource "aws_s3_bucket_website_configuration" "web-bucket" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "web-bucket" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-access" {
  bucket = aws_s3_bucket.bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "web-bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl = "private"
  depends_on = [aws_s3_bucket_ownership_controls.web-bucket]
}

resource "aws_s3_object" "object_html" {
  for_each = fileset("src/", "*.html")
  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "src/${each.value}"
  etag = filemd5("src/${each.value}")
  content_type = "text/html"
}

resource "aws_s3_object" "object_png" {
  for_each = fileset("src/", "*.png")
  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "src/${each.value}"
  etag = filemd5("src/${each.value}")
  content_type = "image/png"
}

