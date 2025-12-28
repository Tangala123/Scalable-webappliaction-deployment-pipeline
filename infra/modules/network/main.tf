# ---------------- VPC ----------------
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.project_name}-vpc-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# ---------------- IGW ----------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-igw-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# ---------------- PUBLIC SUBNETS ----------------
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = element(["ap-southeast-2a", "ap-southeast-2b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-${count.index}-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# ---------------- PRIVATE SUBNETS ----------------
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  availability_zone = element(["ap-southeast-2a", "ap-southeast-2b"], count.index)

  tags = {
    Name        = "${var.project_name}-private-${count.index}-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# Elastic IP for NAT
# -----------------------
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-igw-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# NAT Gateway (in public subnet)
# -----------------------
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name        = "${var.project_name}-igw-${terraform.workspace}"
    Environment = terraform.workspace
  }

  depends_on = [aws_internet_gateway.main]
}


# ---------------- PUBLIC ROUTE TABLE ----------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.project_name}-public-rt-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# ---------------- PUBLIC RT ASSOCIATION ----------------
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# ---------------- PRIVATE ROUTE TABLE ----------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-private-rt-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# ---------------- PRIVATE RT ASSOCIATION ----------------
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
