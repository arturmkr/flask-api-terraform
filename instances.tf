data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "devops_key" {
  key_name   = "devops-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "flask_api_backend" {
  # ami = data.aws_ami.ubuntu.id
  # ami = var.ubuntu_20_04
  ami = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"

  key_name = aws_key_pair.devops_key.key_name

  vpc_security_group_ids = [
    aws_security_group.flask_api_backend_sg.id
  ]

  tags = {
    Name = "flask_api_backend"
  }
}