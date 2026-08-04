resource "aws_security_group" "aws_security_group" {
  name        = "Security_Group"
  description = "Securtiy Group to be asociated with EC2"
  vpc_id      = var.vpc_id

  ingress {
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
  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-security-group"
  })
}

resource "aws_instance" "aws_instance" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.aws_security_group.id]

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-aws_instance"
  })
}
