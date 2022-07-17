resource "aws_db_instance" "flask_api_db" {
  identifier             = "flask-api-db"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  vpc_security_group_ids = [aws_security_group.flask_api_db_sg.id]
  username               = var.rds_login
  password               = var.rds_password
  skip_final_snapshot    = true
}