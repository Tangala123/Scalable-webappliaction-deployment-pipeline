variable "project_name" {
  default = "healthcare"
}
variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "region" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
}

variable "public_subnet_cidrs" {
  type        = list(string)
}

variable "private_subnet_cidrs" {
  type        = list(string)
}

variable "tags" {
  type        = map(string)
}
