
resource "alicloud_vpc" "vpc" {
  name       = "${var.title}"
  cidr_block = "${var.vpc_cidr}" 
}

# Conti Facing VSwitch

resource "alicloud_vswitch" "contifacting_vsw" {
  vpc_id = "${alicloud_vpc.vpc.id}"
  count = "${length(var.cidr_subnets)}" 
  #availability_zone = "${data.alicloud_zones.zones_ds.zones[count.index].id}" # will work with terraform 0.12
  availability_zone = "${lookup(data.alicloud_zones.zones_ds.zones[count.index],"id" )}"

  cidr_block = "${element(var.cidr_subnets, count.index)}"
  name = "${var.cidr_subnets_names}-${count.index}"
}

# Conti Public VSwitch

resource "alicloud_vswitch" "public_vsw" {
  vpc_id = "${alicloud_vpc.vpc.id}"
  count = "${length(var.cidr_public_subnets)}" 
  #availability_zone = "${data.alicloud_zones.zones_ds.zones[count.index].id}" # will work with terraform 0.12
  availability_zone = "${lookup(data.alicloud_zones.zones_ds.zones[count.index],"id" )}"

  cidr_block = "${element(var.cidr_public_subnets, count.index)}"
  name = "${var.cidr_public_subnets_names}-${count.index}"
}

## Conti Private VSwitch
#
#resource "alicloud_vswitch" "private_vsw" {
#  vpc_id = "${alicloud_vpc.vpc.id}"
#  count = "${length(var.cidr_private_subnets)}" 
#  #availability_zone = "${data.alicloud_zones.zones_ds.zones[count.index].id}" # will work with terraform 0.12
#  availability_zone = "${lookup(data.alicloud_zones.zones_ds.zones[count.index],"id" )}"
#
#  cidr_block = "${element(var.cidr_private_subnets, count.index)}"
#  name = "${var.cidr_private_subnets_names}-${count.index}"
#}

# Route table

resource "alicloud_route_table" "route_table" {
  vpc_id = "${alicloud_vpc.vpc.id}"
  name = "rt-ContiRT"
}

# attachment for conti facing vswitch
resource "alicloud_route_table_attachment" "rt_attachment" {
  count = "${length(var.cidr_subnets)}"
  vswitch_id = "${alicloud_vswitch.contifacting_vsw.*.id[count.index]}"
  route_table_id = "${alicloud_route_table.route_table.id}"
}

# attachment for public vswitch
resource "alicloud_route_table_attachment" "rt_attachment_public" {
  count = "${length(var.cidr_subnets)}"
  vswitch_id = "${alicloud_vswitch.public_vsw.*.id[count.index]}"
  route_table_id = "${alicloud_route_table.route_table.id}"
}

## attachment for private vswitch
#resource "alicloud_route_table_attachment" "rt_attachment_private" {
#  count = "${length(var.cidr_subnets)}"
#  vswitch_id = "${alicloud_vswitch.private_vsw.*.id[count.index]}"
#  route_table_id = "${alicloud_route_table.route_table.id}"
#}

#resource "alicloud_route_entry" "" {
#  route_table_id        = "${alicloud_vpc.default.router_table_id}"
#  destination_cidrblock = "${var.entry_cidr}"
#  nexthop_type          = "Instance"
#  nexthop_id            = "${alicloud_instance.snat.id}"
#}

#resource "alicloud_instance" "snat" {
#  // ...
#}



#resource "alicloud_security_group" "sg_group_icmp" {
#  name        = "${var.title}AllowICMP"
#  vpc_id      = "${alicloud_vpc.vpc.id}"
#}

#resource "alicloud_security_group_rule" "allow_all_tcp" {
#  type              = "ingress"
#  ip_protocol       = "icmp"
#  nic_type          = "intranet" # intranet or internet
#  policy            = "accept"
#  priority          = 1
#  security_group_id = "${alicloud_security_group.sg_group_icmp.id}"
#  cidr_ip           = "10.0.0.0/8"
#}
