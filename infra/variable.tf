variable "node_instance_type" {
  type = string
}

variable "node_desired_size" {
  type = number
}

variable "project_name" {
  default = "Web-app"
}
variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}
variable "db_name" {
  description = "RDS database name"
  type        = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

