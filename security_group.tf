resource "aws_vpc" "janus" {
  cidr_block           = var.vpc_cidr
}

resource "aws_subnet" "janus" {
  vpc_id            = aws_vpc.janus.id
  availability_zone = "us-west-2a"
  cidr_block        = cidrsubnet(aws_vpc.janus.cidr_block, 4, 1)
}

resource "aws_security_group" "janus" {
  name        = "janus"
  description = "janus"
  vpc_id      = aws_vpc.janus.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NGINX
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.janus.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}