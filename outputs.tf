output "flask_api_public_ip" {
  value = aws_instance.flask_api_backend.*.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.flask_api_db.endpoint
}