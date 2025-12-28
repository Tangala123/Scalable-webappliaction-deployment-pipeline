module "network" {
  source       = "./modules/network"
  project_name = var.project_name
}


module "iam" {
  source       = "./modules/iam"
 
 tags = local.tags
  
}

module "rds" {
  source = "./modules/rds"
}


module "eks" {
  source = "./modules/eks"
  environment       = var.environment
  cluster_name        = var.cluster_name
  subnet_ids          = module.vpc.pub_sub_ids
  cluster_role_arn    = module.iam.cluster_role_arn
  node_role_arn       = module.iam.node_role_arn
  node_instance_type  = var.node_instance_type
  node_desired_size   = var.node_desired_size
  security_group_ids  = [module.networking.eks_sg_id]
}


