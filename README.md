# aws-subdomain-manual

Creates a Nullstone subdomain that requires manual hookup.

## When to use

This module is useful when Nullstone is unable to fully automate your subdomain.
- Using existing infrastructure
- Using an existing domain

## Details

This module creates a DNS zone and SSL certificate.
Once launched, you will to need to perform 2 manual steps:
1. [Hook up DNS](#hook-up-dns)
2. [Verify SSL certificate](#verify-ssl-certificate)

### Hook up DNS

To hook up DNS, you will need to add/edit DNS records in your current DNS zone.

Let's take an example. 
If you are creating the subdomain `api.acme.com`, you need to create an `NS` DNS record in your `acme.com` DNS records.
Configure the DNS records with the following:
```
name    = "api.acme.com"
type    = "NS"
ttl     = 300
records = [<copy "nameservers" output from "Infrastructure" tab in Nullstone>]
```

### Verify SSL certificate

This module creates an SSL certificate, but AWS needs to confirm that you are authorized to create this SSL certificate.

Follow these steps:
1. Visit "Infrastructure" tab for the subdomain in an environment.
2. Find `certificate_validation_records` output.
3. Create the DNS records listed on the DNS zone for the domain.

The verification process can take ~10-15 minutes depending on your DNS settings. 
