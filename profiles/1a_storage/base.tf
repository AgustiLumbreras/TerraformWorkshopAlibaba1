
module "storage-01" {
  source = "../../modules/simple_storage"
  
  # VARIABLES
  bucket_name  = var.bucket_name
  stack_prefix = var.stack_prefix
}
