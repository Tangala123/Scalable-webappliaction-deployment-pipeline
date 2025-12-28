module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
}



module "iam" {
  source = "./modules/iam"

  environment = var.environment
}

module "rds" {
  source = "./modules/rds"

  project_name           = var.project_name
  private_subnet_ids     = module.vpc.private_subnet_ids
  vpc_id                 = module.vpc.vpc_id
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  rds_security_group_ids = [module.sg.rds_sg_id]
}


module "eks" {
  source = "./modules/eks"

  cluster_name     = var.cluster_name
  environment      = var.environment # ✅ REQUIRED
  subnet_ids       = module.vpc.public_subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  node_instance_type = var.node_instance_type # ✅ REQUIRED
  node_desired_size  = var.node_desired_size  # ✅ REQUIRED

  security_group_ids = [module.sg.eks_sg_id]
}


module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}


