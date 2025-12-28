# Database
variable "db_username" {
  type    = string
  default = "admin"
}

variable "project_name" {
  description = "Project name"
}

variable "db_password" {
  type    = string
  default = "Admin*0987654"
}


variable "mysql_engine_version" {
  type        = string
  description = "RDS MySQL engine version (major.minor.patch)"
  default     = "8.0.44"         # choose a supported version
}


variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "myappdb"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage_gb" {
  description = "RDS storage size in GB"
  type        = number
  default     = 20
}


variable "mysql_parameter_family" {
  type        = string
  description = "RDS MySQL parameter group family (mysql8.0, mysql8.4, mysql5.7)"
  default     = "mysql8.0"  # choose the family that matches your engine_version
}