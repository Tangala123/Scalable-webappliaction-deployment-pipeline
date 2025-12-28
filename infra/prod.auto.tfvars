env         = "prod"
region       = "ap-southeast-2"
cluster_name = "eks-prod"

node_desired_size  = 4
node_instance_type = "c7i-flex.large"

vpc_cidr  = "10.10.0.0/16"
pub_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
pri_cidrs = ["10.10.3.0/24", "10.10.4.0/24"]
