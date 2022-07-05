data "aws_vpc" "default_vpc_data" {
  default = true
}


resource "aws_security_group" "flask_api_backend_sg" {
  name        = "flask_api_backend_sg"
  vpc_id      = data.aws_vpc.default_vpc_data.id

  tags = {
    Name = "flask_api_backend_sg"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flask_api_backend_sg.id
}

resource "aws_security_group_rule" "allow_api" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flask_api_backend_sg.id
}

resource "aws_security_group_rule" "allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flask_api_backend_sg.id
}