output "flask_api_public_ip" {
  value = aws_instance.flask_api_backend.public_ip
}