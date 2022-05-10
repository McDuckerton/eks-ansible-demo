resource "aws_security_group" "awx_db" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "awx-db-sg-"
  description = "Allow inbound access for Postgres from VPC"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", "24.243.66.39/32"]
  }
}

resource "aws_db_instance" "awx_db" {
  identifier_prefix      = "awxdb-demo-"
  allocated_storage      = 10
  engine                 = "postgres"
  instance_class         = "db.t3.medium"
  db_name                = "awxdb"
  username               = "iapeksdev"
  password               = "adminawx"
  skip_final_snapshot    = true
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.awx_db.id]
  publicly_accessible    = true
}