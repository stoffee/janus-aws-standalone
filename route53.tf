data "aws_route53_zone" "hosted_zone" {
  name = var.route53_domain
}
resource "aws_route53_record" "janus" {
  # Using the data entry above to retrieve the domain
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "${var.route53_janus}.${var.route53_domain}"
  type    = "CNAME"
  ttl     = "300"
  # The record will be the value of the endpoint URL of the EKS cluster
  #records = [module.ec2.public_dns[0]]
  records = [join("", aws_instance.janus.*.public_ip)]
}
