
output "cloudfront_url" {
  value = "https://${aws_cloudfront_distribution.s3_website.domain_name}"
}

output "distribution_id" {
  value = aws_cloudfront_distribution.s3_website
}