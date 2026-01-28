variable "repo_name" {
  type        = string
  description = "The GitHub repository name (e.g., owner/repo)"
}

variable "s3_bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket"
}

variable "cloudfront_arn" {
  type        = string
  description = "The ARN of the CloudFront distribution"
}
