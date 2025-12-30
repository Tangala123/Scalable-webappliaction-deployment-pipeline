environment = "prod"

cluster_name       = "eks-prod"
node_desired_size  = 2
node_instance_type = "c7i-flex.large"
region             = "ap-southeast-2"

vpc_cidr = "10.2.0.0/16"

public_subnet_cidrs = [
  "10.2.1.0/24",
  "10.2.2.0/24"
]

private_subnet_cidrs = [
  "10.2.11.0/24",
  "10.2.12.0/24"
]

tags = {
  Project     = "web-app-prod"
  Environment = "prod"
  Owner       = "devops"
}

db_name      = "proddb"
db_username  = "admin"
db_password  = "ProdPassword123!"
project_name = "web-app-prod"
