

variable vpc_cidr {
    default = "10.0.0.0/8"
    description = "VPC CIDR range"
}

variable title { 
    default = "DMZVpc" 
    description = "Title of the VPC that we will create"
}

variable cidr_subnets { 
    type = "list" 
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_subnets_names {
    default = "sn-DMZ-contifacing"
    description = "Vswitch name"
}

variable cidr_public_subnets { 
    type = "list" 
    default = ["10.11.10.0/24","10.11.11.0/24"]
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_public_subnets_names {
    default = "sn-DMZ-public"
    description = "Vswitch name (public)"
}

#variable cidr_private_subnets { 
#    type = "list" 
#    default = ["10.11.12.0/24","10.11.13.0/24"]
#    description = "List of CIDR that will be assigned to vswitch"
#}
#variable cidr_private_subnets_names {
#    default = "sn-DMZ-private"
#    description = "Vswitch name (private)"
#}