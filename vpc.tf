module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  name                         = "${local.vpc_name}-vpc01"
  cidr                         = "10.0.0.0/16"
  azs                          = data.aws_availability_zones.available.names
  private_subnets              = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets               = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  database_subnets             = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
  enable_nat_gateway           = true
  single_nat_gateway           = true
  enable_dns_hostnames         = true
  create_database_subnet_group = true

  tags = {
    "Name" = "${local.vpc_name}-vpc01"
  }

  public_subnet_tags = {
    "Name" = "${local.vpc_name}-pub-subnet"
  }

  private_subnet_tags = {
    "Name" = "${local.vpc_name}-priv-subnet"
  }

  database_subnet_tags = {
    "Name" = "${local.vpc_name}-db-subnet"
  }

  database_subnet_group_name = "${local.vpc_name}-db-subnet"
}