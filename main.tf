provider "aws" {
  #profile = "terraform-iac"
  region = var.aws_region
}

terraform {
  backend "s3" {
    #profile = "terraform-iac"
    bucket  = "iac-urbanfood-tfstates"
    key     = "rds-mysql/terraform.tfstate"
    region  = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95.0"
    }
  }
  required_version = ">= 1.9"
}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  engine               = "mysql"
  identifier           = "rds-mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class

  allocated_storage    = var.allocated_storage
  
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password

  parameter_group_name = "default.mysql8.0"

  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible = true

  tags = {
    Name = "fiap-rds-mysql"
  }
}
