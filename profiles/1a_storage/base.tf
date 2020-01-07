
module "storage-01" {
  source = "../../modules/simple_storage"
  
  # VARIABLES
  bucket_name = var.bucket_name

}
