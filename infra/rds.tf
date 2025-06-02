resource "aws_db_subnet_group" "my_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [ aws_subnet.private_subnet_1_for_Ass.id, aws_subnet.private_subnet_2_for_Ass.id ]
}

resource "aws_db_instance" "RDS_mysql_instance" {
  allocated_storage       = 10
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  identifier              = "mydb"
  username                = "dbuser"
  password                = "dbpassword"
  vpc_security_group_ids    = [aws_security_group.Allow_All_SG_Ass.id]
  db_subnet_group_name    = aws_db_subnet_group.my_subnet_group.name
  db_name                 = "devprojdb"
  skip_final_snapshot     = true
  apply_immediately       = true
  backup_retention_period = 0
  deletion_protection     = false
}


output "RDS_endpoint" {
  value = aws_db_instance.RDS_mysql_instance.endpoint
}
