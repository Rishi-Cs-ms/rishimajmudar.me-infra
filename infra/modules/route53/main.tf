data "aws_route53_zone" "this" {
  name = var.domain_name
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_dns
    zone_id                = var.cloudfront_zone
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "portfolio_a" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "${var.subdomain}.${var.domain_name}"
  type            = "A"
  allow_overwrite = true

  alias {
    name                   = var.cloudfront_dns
    zone_id                = var.cloudfront_zone
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "portfolio_aaaa" {
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = "${var.subdomain}.${var.domain_name}"
  type            = "AAAA"
  allow_overwrite = true

  alias {
    name                   = var.cloudfront_dns
    zone_id                = var.cloudfront_zone
    evaluate_target_health = false
  }
}