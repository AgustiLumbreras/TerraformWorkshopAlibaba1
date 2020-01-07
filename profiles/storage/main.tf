
module "storage-01" {
  source = "../../_modules/storage"
  
  # VARIABLES
  bucket_names = "${var.bucket_names}"

}
