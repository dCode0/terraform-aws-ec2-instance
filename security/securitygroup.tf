resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.tls_cidr_443
  }

  ingress {
      description = "TLS from VPC"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = var.tls1_cidr_80
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

resource "aws_security_group" "allow_tls1" {
  name        = "allow_tls1"
  description = "Allow TLS inbound traffic"


  ingress {
    description = "TLS from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.tls_cidr_443
  }

  ingress {
      description = "TLS from VPC"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = var.tls1_cidr_80
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls1"
  }
}

resource "aws_security_group" "allow_me" {
  name        = "allow_me"
  description = "Allow TLS inbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_me"
  }
}

resource "aws_security_group_rule" "example" {
  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  source_security_group_id = aws_security_group.allow_tls.id
  security_group_id = aws_security_group.allow_me.id
}

resource "aws_security_group_rule" "example1" {
  type = "ingress"
  from_port = 2049
  to_port = 2049
  protocol = "tcp"
  source_security_group_id = aws_security_group.allow_tls1.id
  security_group_id = aws_security_group.allow_me.id
}

resource "aws_security_group_rule" "example11" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "tcp"
  source_security_group_id = aws_security_group.allow_tls1.id
  security_group_id = aws_security_group.allow_me.id
}

resource "aws_security_group_rule" "example2" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "udp"
  source_security_group_id = aws_security_group.allow_tls.id
  security_group_id = aws_security_group.allow_me.id
}
