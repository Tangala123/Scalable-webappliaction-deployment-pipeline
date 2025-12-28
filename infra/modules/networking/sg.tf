resource "aws_security_group" "eks_sg" {
  name        = "${var.env}-eks-sg"
  description = "EKS Security Group for ${var.env}"
  vpc_id      = var.vpc_id

  # Kubernetes API access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node to node communication
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-eks-sg"
  }
}

