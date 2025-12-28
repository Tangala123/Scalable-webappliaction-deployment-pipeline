env       = "staging"
region       = "ap-southeast-2"
cluster_name = "eks-staging"

node_desired_size  = 3
node_instance_type = "t3.large"

vpc_cidr  = "10.20.0.0/16"
pub_cidrs = ["10.20.1.0/24", "10.20.2.0/24"]
pri_cidrs = ["10.20.3.0/24", "10.20.4.0/24"]
