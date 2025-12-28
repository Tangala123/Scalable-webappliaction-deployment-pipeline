locals {
  tags = {
    Project     = "hospital-app"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
