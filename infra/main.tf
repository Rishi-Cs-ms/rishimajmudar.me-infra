module "s3" {
  source      = "./modules/s3"
  bucket_name = "rishimajmudar-portfolio"
}

module "cloudfront" {
  source              = "./modules/cloudfront"
  bucket_name         = module.s3.bucket_name
  bucket_arn          = module.s3.bucket_arn
  bucket_domain_name  = module.s3.bucket_regional_domain_name
  domain_name         = var.domain_name
  acm_certificate_arn = var.acm_certificate_arn
  aliases             = [var.domain_name, "portfolio.${var.domain_name}"]
  providers = {
    aws = aws.us_east_1
  }
}

module "route53" {
  source          = "./modules/route53"
  domain_name     = var.domain_name
  subdomain       = "portfolio"
  cloudfront_dns  = module.cloudfront.domain_name
  cloudfront_zone = module.cloudfront.zone_id
}

module "github_oidc" {
  source           = "./modules/github-oidc"
  repo_name        = var.github_repo
  s3_bucket_arn    = module.s3.bucket_arn
  cloudfront_arn   = module.cloudfront.distribution_arn
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = module.s3.bucket_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipalReadOnly"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${module.s3.bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cloudfront.distribution_arn
          }
        }
      }
    ]
  })
}