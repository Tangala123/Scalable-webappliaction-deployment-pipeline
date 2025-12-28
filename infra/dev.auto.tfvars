environment = "dev"

cluster_name = "eks-dev"


region = "ap-southeast-2"

node_instance_type = "c7i-flex.large"
node_desired_size  = 2


vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

tags = {
  Project     = "web-app-dev"
  Environment = "dev"
  Owner       = "devops"
}

db_name     = "devdb"
db_username = "admin"
db_password = "DevPassword123!"

