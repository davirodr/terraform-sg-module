data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
  tags = {
    produto = "default"
  }
}


resource "aws_security_group" "sg_optional" {
  count       = var.enable_sg ? 1 : 0
  name        = "allow_tls-${var.name}"
  description = "Allow TLS inbound traffic"


  dynamic "ingress" {
    iterator = port
    for_each = var.list_sg
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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