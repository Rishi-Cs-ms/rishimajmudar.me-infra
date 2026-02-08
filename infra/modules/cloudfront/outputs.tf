output "domain_name" {
  value       = aws_cloudfront_distribution.this.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "zone_id" {
  value       = aws_cloudfront_distribution.this.hosted_zone_id
  description = "The zone ID of the CloudFront distribution"
}

output "distribution_arn" {
  value       = aws_cloudfront_distribution.this.arn
  description = "The ARN of the CloudFront distribution"
}

output "web_acl_arn" {
  value       = aws_wafv2_web_acl.this.arn
  description = "The ARN of the WAFv2 Web ACL attached to the distribution"
}