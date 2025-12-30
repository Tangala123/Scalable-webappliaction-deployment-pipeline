environment = "staging"

cluster_name = "eks-staging"

node_desired_size  = 2
node_instance_type = "c7i-flex.large"
region             = "ap-southeast-2"


vpc_cidr = "10.1.0.0/16"

public_subnet_cidrs = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

private_subnet_cidrs = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]

tags = {
  Project     = "web-app-staging"
  Environment = "staging"
  Owner       = "devops"
}

db_name      = "stagingdb"
db_username  = "admin"
db_password  = "stagingPassword123!"
project_name = "web-app-staging"

