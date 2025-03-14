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
  default     = "urban_food"
}

variable "db_username" {
  description = "Database username"
  default     = "urban_food"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the database"
  default     = ["0.0.0.0/0"] # Substitua por IPs específicos para maior segurança
}
