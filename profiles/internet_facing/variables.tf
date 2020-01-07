variable "region" {
    description = "Region name where terraform will be executed"
}

variable "role_arn" {
    description = "ARN of role to assume, if empty executes with current credentials privileges"
    default = ""
}

variable vpc_cidr {
    description = "VPC CIDR range"
}

variable zones_cidr { 
    type = "list" 
    description = "List of CIDR that will be assigned to vswitch"
}

variable title { 
    default = "InternetFacingVpc" 
    description = "Title of the VPC that we will create"
}
variable zones_names {
    default = "sn-contifacing"
    description = "Vswitch name"
}

variable zones_cidr_public_subnets { 
    type = "list" 
    default = ["10.10.10.0/24","10.10.11.0/24"]
    description = "List of CIDR that will be assigned to vswitch (public)"
}
variable zones_cidr_public_subnets_names {
    default = "sn-public"
    description = "Vswitch name (public)"
}

variable zones_cidr_private_subnets { 
    type = "list" 
    default = ["10.10.12.0/24","10.10.13.0/24"]
    description = "List of CIDR that will be assigned to vswitch (private)"
}
variable zones_cidr_private_subnets_names {
    default = "sn-private"
    description = "Vswitch name (private)"
}