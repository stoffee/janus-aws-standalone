
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "janus" {
  ami = data.aws_ami.ubuntu.id
   instance_type = "t2.micro"
  key_name = var.ssh_key_name
  tags = {
    Name    = "${var.route53_janus}.${var.route53_domain}"
  }
  user_data = data.template_file.cloud-init.rendered
}

output "private_ip" {
  description = "Private IP of instance"
  value       = join("", aws_instance.janus.*.private_ip)
}

output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = join("", aws_instance.janus.*.public_ip)
}

data "template_file" "cloud-init" {
  template = file("cloud-init.tpl")

  #vars = {
  #  boinc_project_id = var.boinc_project_id
  #}
}