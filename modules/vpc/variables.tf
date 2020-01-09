variable "stack_prefix" {
    type = string
    description = "An Unique Stack Prefix"
}

variable vpc_cidr {
    type = string
    default = "10.0.0.0/8"
    description = "VPC CIDR range"
}

variable title { 
    type = string
    default = "WorkshopNCVpc" 
    description = "Title of the VPC that we will create"
}

variable cidr_subnets { 
    type = list 
    default = ["10.10.10.0/24","10.10.11.0/24"]
    description = "List of CIDR that will be assigned to vswitch"
}
variable cidr_subnets_names {
    type = string
    default = "sn-workshop"
    description = "Vswitch name (workshop)"
}

