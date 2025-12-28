variable "env" {
  type        = string
  description = "Deployment environment"
}
variable "subnet_count" {
  default = 2
}

# VPC CIDR
variable "vpc_cidr" {
  type    = string
  
}

# ✅ Public subnets as a list
variable "pub_cidrs" {
  type    = list(string)
  
}

# ✅ Private subnets as a list
variable "pri_cidrs" {
  type    = list(string)
  
}
