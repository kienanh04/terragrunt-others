variable "aws_region" { default = "us-west-2" }
variable "aws_profile" { default = "default" }
variable "cf_email" { default = "admin@example.com" }
variable "cf_token" {}

variable "root_domain" { default = "example.com" }
variable "domain_name" { default = "sub.example.com" }
variable "domain_is_sub" { default = true }
variable "cf_ttl" { default = "120" }
