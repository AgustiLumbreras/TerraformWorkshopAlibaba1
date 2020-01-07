variable "region" {
    description = "Region name where terraform will be executed"
}

variable "role_arn" {
    description = "ARN of role to assume, if empty executes with current credentials privileges"
    default = ""
}

variable "bucket_names" {
    type = "list"
    default = ["default"]
}

