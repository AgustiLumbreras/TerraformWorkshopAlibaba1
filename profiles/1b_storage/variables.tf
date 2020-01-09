variable "bucket_names" {
    type = list
    description = "List of bucket names that needs to be created"
    default = ["default"]
}

variable "stack_prefix" {
    type = string
    description = "An Unique Stack Prefix"
}

