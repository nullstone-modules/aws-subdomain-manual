resource "aws_acm_certificate" "this" {
  domain_name               = trimsuffix(local.fqdn, ".")
  validation_method         = "DNS"
  subject_alternative_names = []
  tags                      = local.tags

  count = var.create_ssl_certificate ? 1 : 0
}

locals {
  certificate_arn = !var.create_ssl_certificate ? "" : aws_acm_certificate.this[0].arn
  domain_validation_options = !var.create_ssl_certificate ? [] : [
    for dvo in aws_acm_certificate.this[0].domain_validation_options : {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  ]
}
