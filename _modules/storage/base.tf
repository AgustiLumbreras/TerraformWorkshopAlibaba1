
resource "alicloud_oss_bucket" "mybucket"{
  count = "${length(var.bucket_names)}"
  bucket = "ct-${data.alicloud_account.current.id}-${lower(element(var.bucket_names, count.index))}"
  acl = "private"

  server_side_encryption_rule {
    sse_algorithm = "AES256"
  }

}

