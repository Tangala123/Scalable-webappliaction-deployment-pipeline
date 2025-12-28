# ---------------------------------------
# EKS Cluster (Control Plane)
# ---------------------------------------
resource "aws_eks_cluster" "main" {
  name     = "${var.cluster_name}-${terraform.workspace}"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tags = {
    Name = var.cluster_name
    Environment = var.environment
  }
}

# ---------------------------------------
# EKS Managed Node Group
# ---------------------------------------
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-node-group-${terraform.workspace}"
  node_role_arn  = var.node_role_arn
  subnet_ids     = var.subnet_ids
  instance_types = [var.node_instance_type]

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = 1
    max_size     = var.node_desired_size + 1
  }

  tags = {
    Name = "${var.cluster_name}-node-group"
    Environment = var.environment
  }
}
