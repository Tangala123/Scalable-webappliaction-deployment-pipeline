# -----------------------
# VPC
# -----------------------
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-vpc"
  }
}

# -----------------------
# Internet Gateway
# -----------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-igw"
  }
}

# ---------------------------------------
# Public Route Table (default route to IGW)
# ---------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.env}-pub-rt"
  }
}

# -----------------------
# Public Subnets
# -----------------------
resource "aws_subnet" "public" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.main.id
  availability_zone       = local.az_names[count.index]
  cidr_block              = var.pub_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-pub-${count.index}"
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# -----------------------
# Elastic IP for NAT
# -----------------------
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.env}-nat-eip"
  }
}

# -----------------------
# NAT Gateway (in public subnet)
# -----------------------
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.env}-nat"
  }

  depends_on = [aws_internet_gateway.main]
}

# ---------------------------------------
# Private Route Table (route to NAT)
# ---------------------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.env}-private-rt"
  }
}

# -----------------------
# Private Subnets
# -----------------------
resource "aws_subnet" "private" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.main.id
  availability_zone       = local.az_names[count.index]
  cidr_block              = var.pri_cidrs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env}-pri-${count.index}"
  }
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
