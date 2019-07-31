provider "cloudflare" {
  email = "${var.cf_email}"
  token = "${var.cf_token}"
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {}
}

data "aws_route53_zone" "public" {
  name = "${var.domain_name}"
}

resource "cloudflare_record" "ns" {
  count  = "${length(data.aws_route53_zone.public.name_servers)}"
  domain = "${var.root_domain}"
  name   = "${var.domain_is_sub ? "${element(split(".",var.domain_name),0)}" : "@"}"
  value  = "${element(data.aws_route53_zone.public.name_servers,count.index)}"
  type   = "NS"
  ttl    = "${var.cf_ttl}"
}
