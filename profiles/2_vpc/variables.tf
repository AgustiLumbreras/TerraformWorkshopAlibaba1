variable vpc_cidr {
    type = string
    description = "VPC CIDR range"
}

variable zones_cidr { 
    type = list 
    description = "List of CIDR that will be assigned to vswitch"
}

variable title { 
    type = string
    description = "Title of the VPC that we will create"
    default = "MainVpc"
}

variable zones_cidr_public_subnets { 
    type = list 
    default = ["10.5.0.0/24","10.5.1.0/24"]
    description = "List of CIDR that will be assigned to vswitch (public)"
}
variable zones_cidr_public_subnets_names {
    type = string
    default = "sn-public"
    description = "Vswitch name (public)"
}

variable zones_cidr_private_subnets { 
    type = list 
    default = ["10.15.0.0/24","10.15.1.0/24"]
    description = "List of CIDR that will be assigned to vswitch (private)"
}
variable zones_cidr_private_subnets_names {
    type = string
    default = "sn-private"
    description = "Vswitch name (private)"
}
