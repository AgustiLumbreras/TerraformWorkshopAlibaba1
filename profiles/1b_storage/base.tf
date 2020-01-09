
module "storage-01" {
  source = "../../modules/storage"
  
  # VARIABLES
  bucket_names = var.bucket_names
  stack_prefix = var.stack_prefix
}
