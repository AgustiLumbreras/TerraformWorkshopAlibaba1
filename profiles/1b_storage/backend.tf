#terraform {
#  backend "s3" {}
#}

terraform {
  backend "local" {
    path = "/opt/workshop/terraform/terraformSTORAGE_B.tfstate"
  }
}

