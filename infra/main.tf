
module "vpc" {
  source    = "./modules/vpc"
  env       = var.env
  vpc_cidr  = var.vpc_cidr
  pub_cidrs = var.pub_cidrs
  pri_cidrs = var.pri_cidrs
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
  
}

module "networking" {
  source = "./modules/networking"

  env       = var.env
  vpc_id = module.vpc.vpc_id
}


module "eks" {
  source = "./modules/eks"
  env       = var.env
  cluster_name        = var.cluster_name
  subnet_ids          = module.vpc.pub_sub_ids
  cluster_role_arn    = module.iam.cluster_role_arn
  node_role_arn       = module.iam.node_role_arn
  node_instance_type  = var.node_instance_type
  node_desired_size   = var.node_desired_size
  security_group_ids  = [module.networking.eks_sg_id]
}

