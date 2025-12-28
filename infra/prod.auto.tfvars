environment = "prod"

region = "ap-south-1"

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
  Project     = "healthcare-microservices"
  Environment = "prod"
  Owner       = "devops"
}
