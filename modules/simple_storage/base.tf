
resource "alicloud_oss_bucket" "mybucket"{
  bucket   = "ct-${data.alicloud_account.current.id}-${lower(var.stack_prefix)}-${lower(var.bucket_name)}"
  acl      = "private"

  server_side_encryption_rule {
    sse_algorithm = "AES256"
  }

}

