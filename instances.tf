resource "aws_key_pair" "devops_key" {
  key_name   = "devops-key"
  public_key = file(var.public_key)
}

resource "aws_instance" "flask_api_backend" {
  count = var.replicas
  ami = var.ubuntu_22_04
  instance_type = "t2.micro"

  key_name = aws_key_pair.devops_key.key_name

  vpc_security_group_ids = [
    aws_security_group.flask_api_backend_sg.id
  ]

  tags = {
    Name = "flask_api_backend_${count.index + 1}"
  }
}