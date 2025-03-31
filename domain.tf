data "ns_connection" "domain" {
  name     = "domain"
  contract = "domain/aws/route53"
}

locals {
  domain_name        = data.ns_connection.domain.outputs.name
  domain_zone_id     = data.ns_connection.domain.outputs.zone_id
  domain_nameservers = data.ns_connection.domain.outputs.nameservers
}
