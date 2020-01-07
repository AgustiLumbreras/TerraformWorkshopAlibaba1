
module "if-01" {
  source = "../../_modules/internet_facing"
  
  # VARIABLES
  title = "${var.title}"
  # Conti Facing
  cidr_subnets = "${var.zones_cidr}"
  cidr_subnets_names = "${var.zones_names}"
  # Public
  cidr_public_subnets = "${var.zones_cidr_public_subnets}"
  cidr_public_subnets_names = "${var.zones_cidr_public_subnets_names}"
  # Private
  cidr_private_subnets = "${var.zones_cidr_private_subnets}"
  cidr_private_subnets_names = "${var.zones_cidr_private_subnets_names}"

}
