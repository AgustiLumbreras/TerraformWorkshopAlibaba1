
module "vpc" {
  source = "../../modules/vpc"
  
  # VARIABLES
  title = var.title
  cidr_subnets = var.zones_cidr_subnets
  cidr_subnets_names = var.zones_cidr_subnets_names

}
