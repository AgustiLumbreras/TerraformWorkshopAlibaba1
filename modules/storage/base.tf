
resource "alicloud_oss_bucket" "mybucket"{
  for_each = {for b in var.bucket_names: "bucket" => b}
  bucket   = "ct-${data.alicloud_account.current.id}-${lower(each.value)}"
  acl      = "private"

  server_side_encryption_rule {
    sse_algorithm = "AES256"
  }

}

