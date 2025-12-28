environment = "staging"

region = "ap-south-1"

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
  Project     = "healthcare-microservices"
  Environment = "staging"
  Owner       = "devops"
}
