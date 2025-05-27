variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
  default     = 20
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  default     = "db.t4g.micro"
}

variable "db_name" {
  description = "Database name"
  default     = "urbanfood"
}

variable "db_username" {
  description = "Database username"
  default     = "urbanfood"
}

variable "db_password" {
  description = "Database password"
  default     = "Urbanf00dFiap"
  sensitive   = true
}
