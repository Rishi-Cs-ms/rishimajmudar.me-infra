variable "domain_name" {
  type        = string
  description = "The domain name"
}

variable "cloudfront_dns" {
  type        = string
  description = "The DNS name of the CloudFront distribution"
}

variable "cloudfront_zone" {
  type        = string
  description = "The Zone ID of the CloudFront distribution"
}

variable "subdomain" {
  type        = string
  description = "The subdomain for the portfolio"
  default     = "portfolio"
}
