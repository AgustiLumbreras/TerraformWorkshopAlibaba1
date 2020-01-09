

variable vpc_cidr {
    default = "10.0.0.0/8"
    description = "VPC CIDR range"
}

variable title { 
    default = "InternetFacingVpc" 
    description = "Title of the VPC that we will create"
}

variable cidr_subnets { 
    type = "list" 
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_subnets_names {
    default = "sn-contifacing"
    description = "Vswitch name"
}

variable cidr_public_subnets { 
    type = "list" 
    default = ["10.10.10.0/24","10.10.11.0/24"]
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_public_subnets_names {
    default = "sn-public"
    description = "Vswitch name (public)"
}

variable cidr_private_subnets { 
    type = "list" 
    default = ["10.10.12.0/24","10.10.13.0/24"]
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_private_subnets_names {
    default = "sn-private"
    description = "Vswitch name (private)"
}