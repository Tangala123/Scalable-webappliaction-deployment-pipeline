variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  default = "healthcare"
}
variable "environment" {
  type        = string
  description = "Deployment environment"
}


