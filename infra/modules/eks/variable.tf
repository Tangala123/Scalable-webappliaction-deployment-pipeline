variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}
variable "project_name" {
  default = "healthcare"
}
variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "subnet_ids" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for worker nodes"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "security_group_ids" {
  description = "Security group IDs for EKS"
  type        = list(string)
}
