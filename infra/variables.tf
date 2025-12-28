variable "region" {
  type = string
}

variable "env" {
  type        = string
  description = "Deployment environment"
}

variable "cluster_name" {
  type = string
}

variable "node_instance_type" {
  type    = string
  default = "c7i-flex.large"
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "vpc_cidr" {
  type = string
}

variable "pub_cidrs" {
  type = list(string)
}

variable "pri_cidrs" {
  type = list(string)
}
