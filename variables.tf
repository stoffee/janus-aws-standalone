variable "aws_access_key" {
  description = "access key"
}

variable "aws_secret_key" {
  description = "secret key"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "route53_domain" {
  default = "stoffee.io"
}

variable "route53_janus" {
  default = "janus"
}

variable "ssh_key_name" {
  description = "You AWS SSH KeyName"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
  default     = "192.168.100.0/24"
}