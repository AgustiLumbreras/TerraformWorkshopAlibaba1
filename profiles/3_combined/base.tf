
module "vpc" {
  source = "../../modules/vpc"
  
  # VARIABLES
  stack_prefix = var.stack_prefix
  title = var.title
  cidr_subnets = var.zones_cidr_subnets
  cidr_subnets_names = var.zones_cidr_subnets_names

}

module "storage-01" {
  source = "../../modules/storage"

  # VARIABLES
  bucket_names = var.bucket_names
  stack_prefix = var.stack_prefix
}


