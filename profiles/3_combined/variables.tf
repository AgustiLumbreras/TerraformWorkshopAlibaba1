variable "bucket_names" {
    type = list
    description = "List of bucket names that needs to be created"
    default = ["default"]
}

variable "stack_prefix" {
    type = string
    description = "An Unique Stack Prefix"
}

variable title { 
    type = string
    description = "Title of the VPC that we will create"
    default = "MainVpc"
}

variable zones_cidr_subnets { 
    type = list 
    default = ["10.5.0.0/24","10.5.1.0/24"]
    description = "List of CIDR that will be assigned to vswitch (workshop)"
}
variable zones_cidr_subnets_names {
    type = string
    default = "sn-workshop"
    description = "Vswitch name (workshop)"
}

