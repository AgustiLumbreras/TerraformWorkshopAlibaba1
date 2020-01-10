
resource "alicloud_vpc" "vpc" {
  name       = "${var.stack_prefix}-${var.title}"
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vsw" {
  vpc_id = alicloud_vpc.vpc.id
  count = length(var.cidr_subnets)
  availability_zone = data.alicloud_zones.zones_ds.zones[count.index].id 
  #availability_zone = lookup(data.alicloud_zones.zones_ds.zones[count.index],"id")

  cidr_block = element(var.cidr_subnets, count.index)
  name = "${var.stack_prefix}-${var.cidr_subnets_names}-${count.index}"
}

resource "alicloud_route_table" "route_table" {
  vpc_id = alicloud_vpc.vpc.id
  name = "rt-${var.stack_prefix}-Workshop"
}

resource "alicloud_route_table_attachment" "rt_attachment" {
  count = length(var.cidr_subnets)
  vswitch_id = alicloud_vswitch.vsw.*.id[count.index]
  route_table_id = alicloud_route_table.route_table.id
}


#resource "alicloud_eip" "eip1" {
#  bandwidth            = "1"
#  internet_charge_type = "PayByBandwidth"
#}


