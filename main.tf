terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "mysql" {
  identifier           = "fiap-rds-mysql-instance"  
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro" # Elegível para o nível gratuito
  db_name              = "urban_food"
  username             = "admin"
  password             = ",rootpassword123," # Substitua
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  publicly_accessible = true

  tags = {
    Name = "fiap-rds-mysql"
  }
}
