
module "vpc" {
  source = "../../modules/vpc"
  
  # VARIABLES
  title = var.title
  # Public
  cidr_public_subnets = var.zones_cidr_public_subnets
  cidr_public_subnets_names = var.zones_cidr_public_subnets_names
  # Private
  cidr_private_subnets = var.zones_cidr_private_subnets
  cidr_private_subnets_names = var.zones_cidr_private_subnets_names

}
