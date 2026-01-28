output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "iam_role_arn" {
  value = module.github_oidc.role_arn
}
