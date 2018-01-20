#========================================================================================================================
# ec2
#========================================================================================================================
variable "ec2_config" {
  type = "map" #省略化
  default = {
    ami = "ami-4af5022c"
    instance_type = "t2.micro"
    instance_key = "id_rsa"
  }
}

#========================================================================================================================
# s3
#========================================================================================================================
variable "s3_config" {
  default = {
    bucket                         = ""
    website_endpoint               = ""
    region                         = "ap-northeast-1"
  }
}

#========================================================================================================================
# cloudfront
#========================================================================================================================
variable "distribution_name_config" {
  default                          = ["mysite","yoursite"]
}

variable "cloudfront_config" {
  default = {
    domain_name                    = ""
    origin_id                      = ""
    origin_protocol_policy         = "http-only"
    viewer_protocol_policy         = "redirect-to-https"
    http_port                      = 80
    https_port                     = 443
    origin_keepalive_timeout       = 5
    origin_read_timeout            = 60
    restriction_type               = "none"
    cloudfront_default_certificate = false
    acm_arn                        = ""
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.1_2016"
  }
}

variable "origin_ssl_protocols" {
  type = "list"
  default                          = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}
variable "behavior_allowed_method" {
  type = "list"
  default                          = ["HEAD", "GET" ]
}

variable "behavior_cached_method" {
  type = "list"
  default                          = ["HEAD", "GET"]
}
