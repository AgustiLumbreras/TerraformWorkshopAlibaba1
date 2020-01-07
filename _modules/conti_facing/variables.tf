

variable vpc_cidr {
    default = "10.0.0.0/8"
    description = "VPC CIDR range"
}
variable title { 
    default = "ContiFacingVpc" 
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