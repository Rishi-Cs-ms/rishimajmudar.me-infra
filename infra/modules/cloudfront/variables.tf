variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket"
}

variable "bucket_domain_name" {
  type        = string
  description = "The regional domain name of the S3 bucket"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the portfolio"
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the ACM certificate"
}

variable "aliases" {
  type        = list(string)
  description = "Domain names for the CloudFront distribution"
}
