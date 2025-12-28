env         = "dev"
region       = "ap-southeast-2"
cluster_name = "eks-dev"

node_desired_size  = 2
node_instance_type = "c7i-flex.large"

vpc_cidr  = "10.0.0.0/16"
pub_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
pri_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
