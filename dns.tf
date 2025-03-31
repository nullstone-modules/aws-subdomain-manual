resource "aws_route53_zone" "this" {
  name = trimsuffix(local.fqdn, ".")
  tags = local.tags

  count = !local.is_passthrough ? 1 : 0
}
